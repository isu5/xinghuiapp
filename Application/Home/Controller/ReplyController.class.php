<?php
/**
 * 用户回复调查问卷 *
 */

namespace Home\Controller;
use Org\Nx\Response;
class ReplyController extends PublicController{
	
	
	public function _initialize(){
		parent::_initialize();
		$this->reply = D('Reply'); 
		$this->ques = D('Conferencereportques');
		$this->report = D('Conferencereport');
	}
	
	
	//调查问卷分析
	public function analyze(){
		$pay = $this->checkpay();
		$quest = $this->report->where(['user_id'=>cookie(userid)])->getField('id,type,title');
		foreach ($quest as $id => $questionnaire) {
            if( $questionnaire['type'] == 'exam' ){
                $scores = $this->reply->where("port_id=$id")->getField('total_score', true);

                if( count($scores) ){
                    sort($scores);
                }else{
                    continue;
                }
                $scoreNum = count($scores);
                $max_score = $scores[$scoreNum - 1];
                $min_score = $scores[0];
                $max_nicknames = implode(',', $this->reply->where("port_id=$id")->getField('user_id', true) );
                $min_nicknames = implode(',', $this->reply->where("port_id=$id")->getField('user_id', true) );

                $static = array(
                    'average'       =>  round(array_sum($scores)/$scoreNum, 1),
                    'max'           =>  "$max_nicknames: $max_score",
                    'min'           =>  "$min_nicknames: $min_score"
                );
            }else{
                $static = array(
                    'average'       =>  '',
                    'max'           =>  '',
                    'min'           =>  ''
                );
            }
			$quest[$id] = array_merge($questionnaire, $static);
			$quest[$id]['member_num'] = $this->reply->where("port_id=$id")->count();
		}
		if($pay == 1){
			$this->assign('quest', $quest);
			$this->assign('success', true);
		}
		
        $this->display();
	

	}
	
	//分析
	public function statistic(){
		 /* 问卷概览信息 */
        $qnID = I('get.quest/d');
        $questionnaire = $this->report->field('id,type,title,description')->find($qnID);
		//dump($questionnaire);
        $type = $questionnaire['type'];
		 if( $type == 'exam' ){
            $scores = $this->reply->where("port_id=$qnID")->getField('total_score', true);

            sort($scores);
            $scoreNum = count($scores);
            $questionnaire['average'] = round(array_sum($scores)/$scoreNum, 1);
            $questionnaire['max_score'] = $scores[$scoreNum - 1];
            $questionnaire['min_score'] = $scores[0];
            $questionnaire['max_nicknames'] = implode(',', $this->reply->where("port_id=$qnID")->getField('user_id', true) );
            $questionnaire['min_nicknames'] = implode(',', $this->reply->where("port_id=$qnID")->getField('user_id', true) );
        }

        /* 读出指定问卷的所有问题 */
        $questions = $this->ques->alias('qt')
                                   ->join('left join __CONFERENCE_REPORT__ qn on qt.port_id=qn.id')
                                   ->where("qt.port_id=$qnID")
                                   ->getField('qt.id,qn.type questionnaire_type,qt.title,qt.options,qt.standard');
		
		//dump($questions);


        /* 解析每个问题的选项 */
        $mapper = function ($item) {
            $item['options'] = json_decode($item['options'], true);

            if( $item['questionnaire_type'] == 'exam' )
            {
                $item['rate'] = 0;
                $item['rightCnt'] = 0;
                $item['falseCnt'] = 0;
            }

            return $item;
        };
        $questions = array_map($mapper, $questions);
		//dump($questions);

        /* 开始计算每道题的准确率和统计每道题的每个选项的勾选情况 */
        $replys = $this->reply->where("port_id=$qnID")->getField('reply', true);
		//dump($replys);

        foreach ($replys as $reply) {
            $reply = json_decode($reply, true); //一套卷子的回答

            foreach ($reply as $questionID => $answer) { //$answer -- 卷子内一个问题的回答
                /* 针对考试卷累计正误 */
                if( $type == 'exam' ){
                    if( $answer == $questions[$questionID]['standard'] ){
                        $questions[$questionID]['rightCnt']++;
                    }else{
                        $questions[$questionID]['falseCnt']++;
                    }
                }

				if( preg_match('/^%u/', $answer) ){ //case: 简答题,  收集回答的前10个宽字符
                    $answer = unicodeDecode($answer);
                    $tag = mb_substr($answer, 0, 10, 'UTF-8');
                    $tag .= (mb_strlen($answer, 'UTF-8') > 10)? "...;\n\n" : ";\n\n";
                    $questions[$questionID]['options'][0]['replyList'][] = "\n".$tag; //收集简答题回答的一个摘要, 简答题只有一个选项且键为0
                }else{ //case: 勾选题, 统计勾选情况
                    $chooseList = explode(',', $answer);
					//dump($chooseList);
                    foreach ($chooseList as $choose) {
						$chooseInfo = explode(':', $choose);
						$optionIndex = $chooseInfo[0];
						$optionOthertext = isset($chooseInfo[1]) ? $chooseInfo[1] : null;
						if(preg_match("/^\d*$/" , $optionIndex)){
							if( !isset($questions[$questionID]['options'][$optionIndex]['count']) ){
								$questions[$questionID]['options'][$optionIndex]['count'] = 0;
							}
							$questions[$questionID]['options'][$optionIndex]['count']++; //累计勾选次数
							if( isset($optionOthertext) ){ //case: 勾选题型里面的其它问题,  收集回答的前10个宽字符
								$answer = unicodeDecode($optionOthertext);
								$tag = mb_substr($answer, 0, 10, 'UTF-8');
								$tag .= (mb_strlen($answer, 'UTF-8') > 10)? "...;\n\n" : ";\n\n";
								$questions[$questionID]['options'][$optionIndex]['replyList'][] = "\n".$tag; //收集回答摘要
							}
						}else{
							$questions[$questionID]['options'][0]['replyList'][] = $optionIndex;
						}
                        
                    }
                }

            }

        }

        /* 针对考试卷, 计算每道题的准确率 */
        if( $type == 'exam' ){
            foreach ($questions as $index => $question) {
                $rightCnt = $questions[$index]['rightCnt'];
                $falseCnt = $questions[$index]['falseCnt'];
                $questions[$index]['rate'] = round(($rightCnt/($rightCnt+$falseCnt)), 3)*100;

                $standMap = function($item){
                    $tmp = explode(':', $item);

                    if( !preg_match('/^%u/', $tmp[0]) ){ //勾选题的索引号增加1
                        $tmp[0]++;
                    }

                    return unicodeDecode( implode(': ', $tmp) );
                };
                $questions[$index]['standard'] = array_map($standMap, explode(',', $questions[$index]['standard']));
            }
        }
		/* p($questionnaire); */
		//p($questions);
        $this->assign('questionnaire', $questionnaire);
        $this->assign('questions', $questions);
		
		
		$this->display();
	}
	
	
}