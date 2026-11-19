Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122944;
	b=pTwHiwmEnQkIy3VYMVIZXV6/3uQ67K4EgbWNyN+5cbGA5JzdKD+MhOLxmbK6xLxxlRvJ
	 ZLmVH/LHW2SIYC/BjAZYz5RfqnVodlXWMd2VwjhGf9PmFa+qR7utNOUdgojTQ3Zit1O0R
	 JhJtTHQ30QannlsojGXqdtjxlVayhU+Awe3CKfAXfHkBsbbvrfmDP6tq7IhqVAS3/ytOR
	 Cy3QMuFnH9iMkRdhiqZWa4xvh1w5Hxl664cd589DPRBk7WzMxTY1/ne9IlmTL3/3LJTJ3
	 iQlXsw9CbiA6Mo2JxApalR0Rh1azCNx679OdGgbNSGe2Z6q1hlcDc0/lDey6i++COUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
	b=FyU9tlXDYrZu6cEGT24nFGAIDN2pSF3b293seFHSNbRsuYGaHHCOyBD2grlrE9KuYTKx
	 IKpRH2HQBRJEGNKmUOEUs7uDL58VlvoD+fA0olUEKGsH9mtZcuXjZZAxNpKDNoONxJM7r
	 kuXhiVK6imBQ24BOAL3Kv1zYPn+pU+xloRct2EdEyZZzE77wUusXcS7p/+T96BUiNWQQO
	 LCHD+AD4PpWtLgPQSWek/DT6CJ2oQyZ0ZHLsC09S6x4OmIVm+3q7HXOK08FLi4YPHsOOu
	 2AFj8Mi2jee5XfJvWzHnjtbv7CD35hZtYRAsh5vjSnY6IMMLTePNkKW8dOOuUUCnNXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O81sSxXD;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8760A2616
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 21:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF8760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O81sSxXD
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50933bdf4bso34335866b.1
        for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795122943; x=1795727743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
        b=O81sSxXD9Hyp4+B1MUAl+1ndWb8mw2QCMbknLl8k5kwGnCWiCoke6iIYd9DQFz3/3l
         NfA6oJWn8yHuAMmKDz9S90CxVvUyCF5qk3mQyILtK1mjgMiaQunsfsveMIM+Vy4GrZdk
         zCxrvYTmaFer9gDPn9sAlceEl5NsELOHCC02U92i2uLdya5JNYiMWTaE18s9XxrcbCrA
         IytUCZt1zVQ/YyE7ycMHslHjJLRLwhgrPyDSP8sMDjB3amFPRTzpR1CjKY6qAhxM0C75
         2+4KqD5AD8t72UPHpWkZm6MXKsAbggCVCKLqKudPxYMNXKwy7DFxYYoyf0PaHAGA9+3U
         FuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122943; x=1795727743;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
        b=ykVu3qf7lh+PoSitSzbg/Qtr8efJYQqJ2OeSsayVCkqRVW/S44JeTBEGkayr3CQTYZ
         j5GNjzI0xo2vVbRfSK1dZxmyut6umv+Sz0Hia2L4Wow/1wRyA/29iX3r8cGZjZpOiV4T
         13kY7S5UcbU8lU7E/Lw/4lo9viSbMYjnKoNmbMAGOIP/yhX/P6ihCTJz260nkX+dNlQz
         wIXwFaCNmHk5YjgTn2jUism3eZRte8NenV7itTrOOSIWjnJp1dQrBJjwWQ7cBHnywMHw
         4WNYCN9x8ShjrNjkA+sJNiIzkmRKD2Gam1c5JsVoEkc/2tlBYjaUUqoRfZ083rTISmh5
         MGXA==
X-Forwarded-Encrypted: i=1; AL+hErHtG5BkWPVvUEvnwhJ9U8PrNC+7KztxkA5JDKJNh3aGlzoPhR56SaG9WcdYONCos4qGLmeHifyjOlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NafOA9JFRJLgDYg7O7Tn8EaMAm2VJPJlPCkIXV2TczU3q603q
	BIQri5vPlzIHX2tJi34MLCZyN5UBROGzX13/fTG/ZW4fekmcW2KJRk6O4Xa6C2Ypzr0=
X-Gm-Gg: AYBFou31wgxOu6xYW2zxtUtI5eqto0ZX4PlFrzz85sefCNH07kDO53PiWqaBH+Z2NqC
	bkbitBBeECZ2JdeWBGSKVjjq9HNdVF11M7m8tsBTcWheGMPQf44dMdmK+8Qdq2qr5liFkdOe7vg
	dLvYpnTjFWph/WSKp6PbY0cpvee6Sv+xmP3BlT/u6Zb10BZ8d/z5eWy087R6UfOSFsUkd3U3uNx
	njf2TB3B2KpGH1rQBe668owOzXjYCG4CHNDCwIrg7M3dKjdHyI6BL3zzqnBNSSEpRysCtRtdPGN
	r3zwJT3lhJHIV0muHUwFhvi254vgfWXHkdcYRX2L4lR16lmPMt2dW/ceZTthpKFXbsOs6DxeNXF
	/x/raFoVBybG5AJfFmyaB0uUFekDIJZ33iZgADyVtgkk7m4KfIREIg+mwA3Y8Y4K3TYGSSlEvFc
	dz23n8WXx4x/vyG49uKF/+4qrhLfEAnSgmDlvnpwj7i2H9ODKMP1HbOAgzCmBeCEUguzc8i+SBQ
	auhwo0pt2+SlFv1K+DgAv10C2IjcWKjJnDlRzsOSFPCT57W1dcEXPbohewsr4TwjHVODns7MTtd
	P8Y+mkEQewoDd4aYswVDVA==
X-Received: by 2002:a17:907:7b94:b0:c51:cd1:565f with SMTP id a640c23a62f3a-c51317e3519mr262688566b.11.1795122942865;
        Thu, 19 Nov 2026 13:15:42 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1027878a91.4.2026.11.19.13.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:15:41 -0800 (PST)
Message-ID: <eb62aa0a-b027-4fc7-8d84-05fc5329576c@suse.com>
Date: Fri, 20 Nov 2026 07:45:35 +1030
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: add a per-subsystem agent file
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-btrfs@vger.kernel.org,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <df1c1fa031ba7e66486348dc37d1a7be53c18e43.1794894953.git.wqu@suse.com>
 <63566373-86cc-4a55-8e09-741f283e6786@kernel.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <63566373-86cc-4a55-8e09-741f283e6786@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/19 20:44, Krzysztof Kozlowski 写道:
> On 17/11/2026 06:58, Qu Wenruo wrote:
>> I believe btrfs is not the most affected sub-system, but a lot of
>> newbies without common senses are doing more harm than help.
>> E.g. wasting a lot of human review time on very low value fixes, filled
>> with long paragraphs and useless test steps/results.
>>
>> So it would be better to let those agents to stop being stupid and
>> follow the more common practices here, and hopefully those newbies can
>> build some common sense.
>>
>> I hope the agent file is clear and short enough, that is not only
>> readable for LLMs, but also for humans who want to be long term
>> contributers.
> 
> Then it should be a maintainer profile. We should write docs for humans,
> which can be used by agents. Not the other way around.

In that case, what's the proper file that can also be applied to LLM?

Thanks,
Qu

> 
> Best regards,
> Krzysztof

