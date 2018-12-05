<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2018072560761320",

		//商户私钥，您的原始格式RSA私钥
		'merchant_private_key' => "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCZjDhp+Y7lR1e6jE2rDDJ2o/3U73u++waGgXuuXet2IQMh29ojKcWsT06NGUdZsV+zlPzqkQm/ZRXN0OD/SciAht+l4jHwY63srx2hs3dJLzP/oS+hnqsOOvZANz4nARUqcK8ufrM+Q6/eyh11UoZvrYSSm4LPfPlCwrWvMZZRsJYEZ7ltXTufGgoPj1GbYdW7djY8CL1irzPIrYUpQtSM5UBX7nPsw6xNBp+TqbMXGj2OgHWh4uqXvw0CwJtH1ACob7osE6t9UubZDYQRYq3a94FzheuDv537Gvz8/BwHlfX9fs1HjhVxyrnZ5uKqTEdH2f7hVWWXVJnnCzzsiOGJAgMBAAECggEAFnMn9Game+NYck/9MxsPbcVAYZe6MgwlwhjAapgUyyq8eIDaffWnjy/xPjQJ+JU0dt87s1gNYsx2yabWnry88f3GSUyvHISWc1qPLIs+z5Z1NdTtT+YRAH2ib3UkQzOnUpMzKcsgjeP7nMlUUUkFmuJ11bGjCI8vKpGpWroXTk4XBoL/kVaja86/xndHq88UT70RQhVqwN5LhK2m6CoBXjIQxjt6g/40TlRAMPGvOL11jIqmnon3sq+aD6arh2zxF/tVaaVCzh0/cO1weuqNSXnZJX5kIyFWZUwLsg6MVxtk/cr+iEj7PS4rQT+ufgpGmCNHjh4QOSZtCzaNNteOmQKBgQDZpvdlqsGVAwCxp7ye6OzqvgFeXKCfgnrUC0sEGE1uBktPbqNDZ3WZPLhRUzpOv0IUfjO+BsDXFq/gQF9IGi3/XJ9M1dkKIrhjKgYvxh5n3o/e6D7XHV0R1q7yJUJPRPqnPV1d9qsHAvyIy4dKB/EAjk13RhCvlAtQYs7Z5bNL9wKBgQC0md8Xvs8ImEz5J5FYXYfiNIJxMjXrllTZ6o7rIv6oMLIDf4rBZKNK/o0TfxACOlS0ytSsrHu7NumJpY9aY6g8QxfUmQC/70EUHB3JhIUVM03dBJWHqzirEDZeW0XI+cHUn4latbqesvLxN/keHlrwT86wSRkL9HfE53kFv3refwKBgH9aRgoT9v9E6YQJ/MES04WrNcvL8SRESbCHBxbXTX8iabCJsTgAcnv+Xm8ffs+S84xgJ9B5zR5NpQ1XPSlIQD/aJ0/jFQLsO+2yKjqL90CZpp8sT5C5GrsUXftLt9gAKZXvvxD7AymwIqm8RWYY7XiAy20N7zd9LX2UwyoWUGoTAoGAP6jhb6BNoAz3TPf6jrhhVoYF2NrHEOTrweihOhcaxrRrezow8dyEhsHVfqLSRMbE5vl8H+Wos6Q2i9N1BXqNabiIpOLN1doDCZCjm04ADyoHbznXb3wWPI45a+cmYSJQhZ86rmPShXA0nHyLbmdqzLyE8bTChGlG8nxZN4J4UAcCgYBzGmMgL25RfdlpuAcJ6cCbB6/fk6J+69fK3V6VKel3SP0tI8ym6YCqHyFq+9bozes2hckboYbnAXRSJmCKp9G88JtRnAdNtx5FOE7y45UJNLTO0/iLUylhWRHq8d0IsrT4YrXpItaZ0HGfylOgZqxlTtLfBlTu3fggQF4so5zd3w==",
		
		//异步通知地址
		'notify_url' => "https://xh.2188.com.cn/app/alipay/nofiy_url",
		
		//同步跳转
		'return_url' => "https://xh.2188.com.cn/app/alipay/return_url",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs8lzy0KraLIEv/gof7lyRrZ9XaEWOuOoFmxEKyloRiGJgAa1iAkTkPF7N00vSgqD9PxXXXLQF2t9s3/JM7JYao206V/nswzAFkLhCWNJ7Pc8e3Lbc+8DygtCEDWheMcv5VHOGONetEaubMyx7gXEEiJW+sRT87gyEiZQgLj9xplJrOejWsexC7vZtwSth/9fe1GT7iMtXv0Ah3yWL19ZltAPD4dIOWD3ojYymKa8cm7znUSupTYT1AWnLvbMrWlNu2kzythd8pWmHFlvprLRRGnoIk1dN+rP8a8RBhNsdhrFyj4ZOU2xLn2OkvizEtsi+qxe9vlU6g7O8uNdZskR5QIDAQAB",
		
	
);