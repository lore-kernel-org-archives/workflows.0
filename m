Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F28328B4E;
	Tue,  6 Jan 2026 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719075; cv=none; b=F3uCxGm9gNmy3O2xHyjY/I2xy5QmNZKwawo4zM3xFXzuiMRx/xBMBs8Evp3ebAMTpbU6ZwgOLERUF21K2uJBnqUy6ACfJ+0jLIjedlSa6AhUbiCpgF5nTo+iQOx/+oFI5+pFRG/2Qq7Ohp2dLcrEX4gYTiqsCIX5yCmR0BCsTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719075; c=relaxed/simple;
	bh=S8+cqA6TEK+ZRvJ3y9TIYqVOQpqbLuk+3y261U5lgFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VK7W30+7Ih9uWLlSIc2iLZ7DSbIWJ5gFc6sC5El8H0F8sfBy+IBW+4g/NA1Xrw4XO88Qas4GYW/UwlviwJVS8hZk3XsvQjPsOedTPcnml1xNl2nDrSuPHCapcZcGLeLq7vMS0KukwA28lN+Nd4j8tZCmqytFnE4r9gNv/akL9/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.kiszka@web.de header.b=wMTZsxQD; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.kiszka@web.de header.b="wMTZsxQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767719064; x=1768323864; i=jan.kiszka@web.de;
	bh=S8+cqA6TEK+ZRvJ3y9TIYqVOQpqbLuk+3y261U5lgFk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wMTZsxQDXQ236XhNQFJV+L0N1cEkE5HA/t646jiWmNIVnQJdAZY28hy88S2REncA
	 s1z6pwCzIJuCGHGCHEOFOBWfkT0Dq80o2rvWhjRiq0cSZJZ9LGy0sqGZFx9VlRJ0q
	 ZzO6qOwEOwZk4DIbQ32UNZc7xjvAMP071iamtVyM41UcII4at8mStaGknZP7QNYWi
	 d8mt5si5mJQRW+T68TmXQNTe+0dinRatNpzmT/PsXaF30MHDwu6KkrvKKCRbLoGcU
	 4zwcjfSyOjn1mw57uttM7KYs/f61FeHcsUUZ60rhD3JJ45YiyREA7Qp1wZKffInvG
	 UTImQrg8hxI7eBg3BQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.10.10] ([95.157.49.24]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3p7-1vgnmh1klb-004S7F; Tue, 06
 Jan 2026 18:04:24 +0100
Message-ID: <2f31637e-cc52-409d-853a-069149efa44f@web.de>
Date: Tue, 6 Jan 2026 18:04:21 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
To: Gal Pressman <gal@nvidia.com>, Vincent Mailhol <mailhol@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sotir Danailov <sndanailov@gmail.com>,
 =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade <paulmcquad@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
 <ce4af5ab-5dcf-4b67-b1af-f2288797e342@nvidia.com>
From: Jan Kiszka <jan.kiszka@web.de>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@web.de; keydata=
 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
In-Reply-To: <ce4af5ab-5dcf-4b67-b1af-f2288797e342@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5Gelor3IqsGVolDBoTC7QvHIuYA0noI+kEnN5WW9/l6aWBOCZv4
 +y5vu0jYEymRSRGFWrEU8kV2f+89C27KbV2MBHa7F9M/GCkxe23Ibk8jX2sdr5GOYhStu95
 Q/q8luqDg/IKs6KHJlwFlE1udpa6k3JTF3MibIQsi02DcjeQn0bDiDJCSmGB8pxtIXP5/nd
 MFXZxrZ2LwJlxXbBC8CsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZxhC08LM9Zc=;Q6fJBkz2eH71sxjUeQylDNHHxq3
 wese9nBicWQFDlZZ2s2yQ1V0DpvLFvYWE7/qDacQOm0GWVoZDt4T34tKL1bw1HK3MoT/hwzGq
 85ObllFaF9mJmjBkaWBQIg+XbYczHQ/e4611N38uq8dct08mkJDIMYRHxOaighIPj+7R/wCD8
 TaSbiHLemxLo+lWai+IR4tqpEzbjWtbX4P0MEf3tW5OrUlaYJpIXFaSDvBYFXhDfcrX1QsDfw
 rcMCL1dFTpYTyY79OCA7fd+vZ4Zvj2aSLtWOsxTsEtZD/iAeiAkWYuABGSbp1StyR03e3UYtg
 DnH7HjBL9zx2JbOFxyhcGrhtv3/+dHg6MzorwzIGFxOZP17stAvzPsKQyOw9ZpE+PCD032Bud
 rOTMiwVQKnJnDRdOfdQkfEFld4jqEDerS437dcdRnZxcJqXGeo8udaNBJJlQ12MCEIvGTYcc5
 E+VnqjPPBdKkAHr7vMUXUzpnZ4+fOCoD0X8UnrPXWJ/lmPIeNlUg3UtXEwTRx9wVKO7PdcJou
 ta6afbyi/aN3iF26oqfkN1NmTAEGTGwN+jEQaXqig9M70sZe/gCkEt0XHVdJvhEn4yv9fnyVi
 HecOgUWRWXtbudgn49e9okdDSZJv4QLEYQa7wKN8zi8ed3bUOk2iPcKYKtquJmageAcpd0VYJ
 rixrSYMn9VN1Z9GXmpLiunxeVYNU393TIVGtcdGymXVsIUtjyWTgaGi2PXYWg0GF8gQMlOE3A
 8XoTL80QPw36/gzLg5O3f2yogzT8S+isAUZ85QtH1QChU8vOcsT3xNlyty/3JDZcfK3p0EVat
 h+BgCub2jyA5qmejJDnpNkICpBSEeSg+f8PB6i+i8c3Euzz6OUhc0XtErNa1rb/+c/Lgzv7Aw
 ZNFPv7EwcdCVnqET8M6ITPuNSMVYE5EmJhGbXG3frbVusVZf+ynRFBp3i6o1A2u+NNx6a/p51
 fbtgbnv7Y4asYxNJ84wruLDJsO8FiEm5JV/2PcyngAbbMnwmwX04GEs4OWs76adFAOQqUDj7+
 Mw0NhwJCHRk9T/zN+VLq0JQx+inMAQXzasuRIfOFlwxd/HMPpbn1JevyOfsXUOOJ8R/bfHiFZ
 zXJ1c+FCShNKK8MOR08CJfBCpe242+71SS6oWAzD4Kbi3aVSHY8d7XNHSLHbsXB2dQWOgqDL6
 8tWK3nw1w5EwFTVLmdNszPoaMS2dd6GtEyx2ILEiqHXm/h55bWTojVKFuJD5Dwn7gp1iBiz3O
 S09uWWlGB6vQdDc7eVUOuAaOQKZmkEsHTOnFeX5unEn30o7FTUZ05gTGdEwG5KRemIGEKAkeb
 LzI1CYimz1w0k5nNLD3BJD8YxWlMyNcou8OhtjvllCyFQwQW/P9zgi6JiwtnKTWthHXVs7Zlj
 vWTIaR2ye1DP7dPxwe/ZR8CeedWl5harujAxb8q8usDnqbhC1O0HkXWylFD/HnwKyNWo0BCld
 SpVhvrjcgOJeBg262/se3j3RkV44MEewJgQyRQ0omA8mY13elIXIhynQWB+xFCSjS7/Udxg9C
 xkWSYvtrKiA1PlY7uX9+J/PkOjmuZEa9eZ8CdV2hGh2hSNlcOIKSDzdk8NVhmaog1xZ1rUECm
 GN3kRKsuHbrS4RU+rGbd9nEihA2eUd1oU5iS8SHLNt3HY9uzLZauLrlIcsgb5QZVCJmEdNK0J
 MiegqLg33vk5T/8yqA9v1BpkmF1clOGfb6Tgo2GDYS+FV+exv8HimoIDdo5tAhlViX9Uzk/76
 pMgGtoABvWkqo/GBuBvdYDCIpnPZHmUfmGAx6C9P0rYioCPbx4U+00DNv16hhmtrkhAWInW+2
 DCSEfzq+mPe2fWS0IjzAPrnam+FPP/xAXB4RCYgVPGt8K6zZ3gMEaLDKAuI8ZG1JBea6BbQK/
 wGvwX/rR0N67NFoIZbnNeHBX0vnap5PF5+xfWjHX/BlFBHsZylszZLxpauFT55wwNtK6R2/xv
 L7EubTVW4al35kM2ClcjydmXJuppyudM5p0b3wnblBEmfknDMvhLsSRBnnIKxakBEUB6U/MZX
 5VmRjv1I05fMZUxA23TboGcJH8MU+tUrXGkJ+MMEm34YEnRidjJBu9ET8BnVTtI3ETeDFt2fk
 cvNN6fPiUe187RpniyMiCX2c+Yi4b41MVnEJ9CsF3Z7sA4eFrjrn7i/XoJaByPtZ+HNEA4sO5
 K+F/XibjgryeTafaUTv/dNV6Lic2+ArjgCMBFmfwLEgq3B4fbcfT3NPIHsWZqqOXzjB4h7BUq
 YQtnIBNViYWMr9xsHpzOmffeimuOi9yRiPNOhlVNxDdfvtUSdoPQlS7OfqxgFJH5KfQFPx3o4
 1qBK2v55R6XGGFQMQ0IjCUDZ+iRrnpVc0xho/Q7FaOicW7fPCSg2+CbIiciXD8yY4rjAz45yC
 iEdfCsEvp9oahU9SmDqKApPe9EcC/XbMq73rkE4kUE1+mbgVyHaOHsegizue7/wiMdenHr7Y1
 zyIOnH3n2draGWcDH7mXuIMMhDVSEmAxT/9Ifrkok9gDAB6ux97fPuZtiqfwEYh4calBvFMru
 ALM3vlhxwpP3xa7vPHVeplBW/VogbgSuATqLRlOtJsWl+uFmirQl51F3BrOtLWwlzuI/aWj54
 9FVHxWqTIYp0jbEoCkeIo+BETWoi7Wb6NDtFIwimD0zohl9O3D4VeMig5zBnAxrF0x/oFXO/d
 Ai0VDh96OFvXsOyUi0oxWJfzLwdE/gPmGFoQjEVFr2DP2iuh1HVVViptPPP7T62umngH5Mq6L
 Ui9LI35Uz5FogvP6H6phEdQNFgAC9vL1oV25nVH7pmzKlEXshLZXR4H13H6TY6pEXM8BmlXIg
 ZNAfvCdCvqhLPSAGTO/kwVbo4Xdi3D6B55wTZRgxYcWhKy226MgBC2XQBAn0Yf3MkIvR+L/G9
 DNqRRiWIJGj8vQdjAMsjcV3PtjpEv4us6cgdv2Ta0VXqH7yHTnyLa2mIL3iCvjpuV7JiVK/9/
 2G7c+KbQ+BX/uREZBRlW/wjbOO82Jy6iZb6Ypc8x0N0QuD+N53uyiTh09h0Q4dbSxplbhaVAa
 dRA6AXqY9tISF1saYgivBNWf9u/PzxrmxoRIF6xjHuKp4nhrC26rPb56IDbcAJeEoZcjsTu8j
 V8A0tJWMSlFvz0rFwDDklS2dzAebB1lqTylmP54ulUVQ/gUCFBdhziVz9H//OkVtcxMOZJ9+Z
 KHiE+Yc+5r5t15gUuwr6lY3CDML6pIhsCJ0d9640bwJXnNQC6CmvOm1dwhGhkvZvuqVhzUjth
 HBnQxq8i4Mj+s9214R4eFHsZvoP6KSFgiriLQ5YgmmB0v/6P3RoZmIdFqTMh5vaOTvYNOOT6i
 6Ira2CSX4eV+EI11yvMg0FxwGM5F2zpKHAPX2VUb+XP1ChphxGGgT7lj6bah2FNirDTNgI4Jb
 wo16jmdYKhwDwdD3quG8XgrdZBn508ibk2WDoGB354FNjjoUbI9yOpI91icZg5/ywc6vdaE1w
 BiRKtvNXzNVUQ/AX47wJMCqjcaYQUNNdV5ruaitsnqslH++YzYiJlxVcYnJ3RKNeKSr/NW2es
 zYgsqa0uuecuo8jCitByxaFL5qonJ6hXvRb83h2qLWGToN30f2U1NFEUh31ByOuz42T+Y6O3u
 qrM/2Ylzptjs8KzGyK1MDLj5LEiXYVs4O/otFQrIqO3P2LM90q6vbOfz9DAzhn1pUcdWiiuJI
 a5F0RMYf4eA8ppNdxiBudWpaoCKAQAFGuDkc6auKtIChvA9lLWc7q3kOHQLdpLs1lxOOHtFv9
 o+Q4Yq7Xu2z2iDONmmTEwoaX5dsNwAcIGRlNtaXx6PQ8fSmMyEcDIrYlziJ8hMQmeEBidNKQ2
 UVoMBga7IOUiuqY0kufLgFR5X49MfyWqCw9BPeW+s7kSYrk59vLZk8WvOnrRDviWEBPMeOzzV
 xM7nPQj4sZdWNIAxXL45TaFvLk/ujUFcESDEhTrnFm91VyaL2u19Arq4oBr5n8PDvGmw4j3b9
 sojKdiXFdrjM9EIcEZRfroc0Q87PSWLbjpcRxhm9e7w4HgkErHczF5vxEj/OCe+iW9Z75n5Hh
 m9oq1rdJuq0hYpUoshFNyjb+1Rc9x+Cb8/2O08f6NIroW1z4eleSCQCXG/2viUg3CfMLqRY7W
 CQMzpyfiDQdGrrGHLFEHofG69W+SoVEzPsFg1IJTuRyHkVFvBHeBikNm1If6Ym7mS2R4ExTX3
 bRLjgyTkO4fyvgKbXl5B53S5+H0CTYmr/xlkBUWaTxr9otPWMcq9GTJoRlL8arjxTUpczi2Bg
 rKcT/n0HjJhhbWTCQGSoS3YU03cUNr3GAs4q6UzKBilBgkv8pTrS+NH55dH5RRQPaDLyvbiXg
 3BjcKI18F3LF0qDRzr5IvFMRKFEBNwUSgDrdPc/NAy0U+sHNSjP6wtnaY/HEucyYIg72z6jPG
 +sptQuuNpVElfSnZtAbeJbuhqJY+tH5bVYQXJTUf8Brf8bLUaDwFVZUHDa4iVgTdHRNJe5+x3
 zmy6f1uOCGc/qCPSIEjCgvM9LLIAG8txyMJuxeQzXf07lU0VUJsZ6HyMuUVlTO5Y0yNOEdDM4
 5WEMLGJ1O2yqjQtVpJljrCpORt7RDjwI001u/D/QDsAOXdqHqu4H+3mEp1sfKvUAnx19OhLl1
 /xgCAhIn3CQ2GDrv9/OisWcLdRkhVQwDZkvUu7lz+q3xd9A0iaHOpXDUwpNAG3deQ79O08omi
 Q3VhHE5uueIhymZHyznJsQ+ZP+LRE0pRnPNS2Qgk2pEjJgBSWeWEhZ7C8viNA82EV54hqPA5d
 KjoIBOaH9V4fZYlcGgFVnFcB+6Yr+v5u7gwmcU5vfNdk9CZcxFwkNjm9HUxkWwsDbZRytmYlV
 NRTWkiLcPdkyjNbmtNhzxW5W4DYCwSsb8kTc7pYzd1L3+9+8zyhfytACaBaloN9WgzsUzhK8h
 RoC7Gf72rRkGFqHKBdg0yLTzjceVlhPG3E5GyrJbijXAakMZ+kAI4Hmts60Fd7hu0gbdQkEEL
 rBYB4UhKaabq9RWk9JbaqurdCR+ntokHBU1kisgrPJALYbiZYvkvnqX+Zg08NuhLNho4ATToO
 JsV1L6B2YSo4NIKN0Mc2r69TfNEBVcVkdpT0IQlV+MrCrGLB2Gx5YajDfklMuP/p1/SCSWI5z
 /6eHWNUjHK4lWFfLO0HBwjNFCUlSvKVbuzBZhVBQhcCCuqrXGspvwQgVlLNjq499Bgj9M1WmM
 CrASUuFrhG9kvYuH3fKMgmEjWmLL7

On 06.01.26 17:42, Gal Pressman wrote:
> On 26/12/2025 1:46, Vincent Mailhol wrote:
>> While reading the git-format-patch manpages [1], I discovered the exist=
ence
>> of the "Toggle Line Wrap" extension for Thunderbird which I found rathe=
r
>> convenient.
>>
>> Looking at the history, the ancestor of this extension was added to the
>> documentation in commit e0e34e977a7c ("Documentation/email-clients.txt:
>> update Thunderbird docs with wordwrap plugin") but then removed in comm=
it
>> f9a0974d3f70 ("Documentation: update thunderbird email client settings"=
).
>>
>> Extend the paragraph on Thunderbird's mailnews.wraplength register to
>> mention the existence of the "Toggle Line Wrap" extension. The goal is =
not
>> to create a war on what is the best option so make it clear that this i=
s
>> just an alternative.
>>
>> [1] man git-format-patch -- =C2=A7Thunderbird
>> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
>>
>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
>=20
> I also use this extension and find it useful, good to have it documented=
.
> Reviewed-by: Gal Pressman <gal@nvidia.com>
>=20
> Btw, there are some tricks for when you want to wrap parts of the mail,
> and leave other parts unwrapped. Useful when drafting a reply that
> contains code snippets.
>=20
> I don't remember the exact steps, but if you know it then it's good to
> have it in here as well :).

This got broken quite a while ago: You could enable line wrapping, mark
the paragraph you wanted to have wrapped, select "rewrap" from the edit
menu, and then disable wrapping again. The used to leave the marked
paragraph wrapped-around behind, but not anymore. If there is a
different trick by now, I would be all ears as I used that very often in
the past.

BTW, if you want TB to have better wrapping support natively, please
jump on https://bugzilla.mozilla.org/show_bug.cgi?id=3D1587153. We either
need to convince them of that or at least finally get an add-on API so
that I do not need to permanently bump the supported TB versions (see
https://github.com/jan-kiszka/togglelinewrap/commits/master/). With the
API Experiment that is still needed for toggling, I'm not allowed to
declare the add-on as compatible with future TB versions.

Jan
