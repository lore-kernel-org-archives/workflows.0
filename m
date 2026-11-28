Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795844622;
	b=04PuJoRLWCbp+HbvEGWywkrcnIUsWe0gPW1hbvcBFMb5nsFD/7i9Rn0m33ylaTNSd59+
	 QbqVdx70R+IginXlWTWtcN8DAOlyiOfa9sa42i9lCDTPdG5TUzdYr0qfqS505aR+JcmV8
	 ReorO4rUta9YpLxkvs5p5QY3poGrbhZt/p0dcF4tFCXA00EzrboXVnCGBEQIudMORIDXj
	 SNTBwI5A/i6YQl9fwOMwGPEyZwWntpOed6RekvSBn7M6xgVPQP7Dax6a7i5O+QFSBDRn3
	 ZjyScWPD4rPiw9UfpcXFpQTRpi8qO1gdfh+HI+Mp3R7//WU0vK+iBsIcIIbSiZlo3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795844622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bcPnOaDULJWAknTPZNtEm+h4HZFHDsds7HqmJHmlW0E=;
	b=rpwUX56ypm73d/YtyYoqCk4UM6QVcaZOgUmGPOb+7NniP+uXAFiA2m/Hxo2OFluC//pS
	 Uaq37md3HI5D33vmxabrXLOVszmM0Qr8rV/C57j4jSLwS8NAoeb2HzYtwB7Cwe5DnB0zK
	 w9PN15ftQwuNOVBfm6NMV2qcvgZTLSu/W+SrCYpEDpRtK+6fSPScyz/ILFlcGRA5cmN0/
	 RUg0qXxAMOskJZqAbhFjlLQ8i6CSUpUrust7N7fdnFefiDvx7/Heuu3tg9O+rGlS41LCw
	 eI6Yr1mQy39YHU+gu7H1czMy9Jr3zs/E0X7TDsK1fm2dBdG1gR24aKnhtAZxrUVhJwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W6NrKuli;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EB606A31C
	for <workflows@vger.kernel.org>; Sat, 28 Nov 2026 05:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W6NrKuli
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso11598636a12.1
        for <workflows@vger.kernel.org>; Fri, 27 Nov 2026 21:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795844620; x=1796449420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcPnOaDULJWAknTPZNtEm+h4HZFHDsds7HqmJHmlW0E=;
        b=W6NrKuliSDPJ0DMhL1hyQ4WnYhMq/6j0vdDxnC+tpl0KTj5qYdf+jR+wBkBJ3s3ACR
         tOK1iZYH2J25JIEgrF5yCWY9qk+HJoAibPBDMiOjPnQWeNmRd+ld9TlbM3RgCTet7bl/
         zR0Vyc58mFPzE49I7Bjgjk1Q8YsYafLzAB1iBmZTNTd1UduJA4Jd/NR+PFSCUHkNnJhO
         d+XipmpKTfeUUBMHD1HomW1nfLMpdxyAbqb//OnYr4CGEp1CN3zgRe56CAHYelT3JgSR
         PJlvrTn6pQ/0RRZrF/wbBQYdNm4FERTXG4HaP9RMX4vvq/LTtM1/Pc764EakMnur6PJo
         Fvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795844620; x=1796449420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcPnOaDULJWAknTPZNtEm+h4HZFHDsds7HqmJHmlW0E=;
        b=zRKCsHvlC5Vp9xIU+NpywJoNIr41WJ/vFq9qqeAQyFVZjxEQyarZyPyRFVLCTdvICV
         JghHMTloEaZfWUAwWC9fVUyz8V7xFGNqY8snNswSInxgnGBSC6FsJx0BaCd0Y4lIqcBD
         LlWxsICT6pZSy4s9ilxP9+SFZRIjhzrT4z++NRpkU6eqPQNyyK8O4pXO4rjBtenYGZ65
         Pr/ALBe+Q8KPW+0c3ul6Xjd9lLKvF6QmAE1dsfGN73tYrnLlrmuAoAtzkPjnut34sIaX
         Tycx2+OJZkr3fRVtbOK7G4zR8uobQzg8gQ+JnJT67R8NI4nKa9DbkdeiYaAgPKp9QxyO
         DUHg==
X-Forwarded-Encrypted: i=1; AL+hErEdt382zfzwHDndzbhnQYZYlfJmxCaAzEOR8BbNZlg47V2m3zUhgYAtZN6+s0ZIwY8vJ5cZk02ZQPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d7GlMgkixXy9dgVtWw+Z4121Q2D1B4CKGK8acABZY/EnppwSE
	j029FzAmyslHO6ms5qp4H2RTiNwevXU9RkmM0/vCwT5WV9MydBvjhQZsqI6G/kJOrkkmHl0us3k
	UGjtdtPU=
X-Gm-Gg: AZFdTZdX99+v6rzmoIL8euLSQMOoT/UtzUIaPNFhJLqNOvjqpo/S6dun8o8pUYkBUcq
	5GZEi2ZPR6AHSOM/Ub8dazh+ANX/gcZrAVuks1prqZo+TfR9SNpfXfm6YYi8M5CWzzRTOU82pNa
	BiWbPegHrS4x5JG/9zl2Kfp+666395IbSuORI51j0fz6xdQ/xUulgQNeksNuL1cTuknRlz+n0Vl
	Mcyz+jZyy7ne3gCMBaZKeKn+0gOihnKlc48xCWBMM1bcML1fYvK6IUyTb2i1PzT7vHotX/hSWxA
	OELY5/SEi1SoV83bMNadiid2Y40OxNlMMS13c+KFzKtmhLXGe9uphpyk/WwNXzMVxyet448LGVw
	8mqErp8kDnaY0/g3lThRpVC8i1hwrzBl3pq6IhvIOptdUeAdx32RHrpN6IXLswNXlLsy5CHjiXN
	Wg9/cwEfSe6teQmEFKxc4EOndl0RnmaDiOXTMPMcpHhfl7HblqNUYwrVIVSDckR/zVZ18j5MnaW
	jsuadXM+EjfIUeViImPXh0bZpmEcKIpjceYjiOq/qLeaBswhrPpJGXsxr1czwBU6OLdpXVgESSF
	j8fbz3Hdj1jTachRQu0+52M=
X-Received: by 2002:a05:6402:158a:b0:6bb:6c8:c4c6 with SMTP id 4fb4d7f45d1cf-6bb06c8ca6cmr12267604a12.45.1795844620451;
        Fri, 27 Nov 2026 21:43:40 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm11366549a12.27.2026.11.27.21.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 21:43:38 -0800 (PST)
Message-ID: <05837923-9377-4ab5-b46d-ef0124784c74@suse.com>
Date: Sat, 28 Nov 2026 16:13:32 +1030
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
Subject: Re: [PATCH] btrfs: add a maintainer entry profile
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-btrfs@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <0037554862c0d9dce3ddafd1238347e4b16a5079.1795581896.git.wqu@suse.com>
 <20261126133712.GN774860@unreal>
 <978c5ae0-8cf2-47d4-8fb5-1d96896132be@suse.com>
 <20261127151418.GY774860@unreal>
 <138ba3eb-7225-429b-9791-2de9d49e1fdf@suse.com>
 <20261128045649.GE774860@unreal>
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
In-Reply-To: <20261128045649.GE774860@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/28 15:26, Leon Romanovsky 写道:
> On Sat, Nov 28, 2026 at 08:31:09AM +1030, Qu Wenruo wrote:
>>
>>
>> 在 2026/11/28 01:44, Leon Romanovsky 写道:
>>> On Fri, Nov 27, 2026 at 08:23:13PM +1030, Qu Wenruo wrote:
>>>>
>>>>
>>>> 在 2026/11/27 00:07, Leon Romanovsky 写道:
>>>>> On Wed, Nov 25, 2026 at 03:16:21PM +1030, Qu Wenruo wrote:
>>>>>> This new file is mostly based on my personal preferences, focusing on
>>>>>> how to improve the human readability in the LLM era.
>>>>>>
>>>>>> The new file should also act as a guide for humans that want to be a
>>>>>> long term contributor to btrfs.
>>>>>
>>>>> My previous comment still applies. Most of it is relevant to other
>>>>> subsystems as well, and some of the suggestions duplicate existing
>>>>> documentation.
>>>>
>>>> One question is, I can't find a generic one, nor there is a generic entry
>>>> inside the MAINTAINERS file.
>>>>
>>>> If we're going to create a generic one, shouldn't we just update the
>>>> existing docs like `Documentation/process/submitting-patches.rst` instead?
>>>
>>> See Documentation/process/coding-assistants.rst file.
>>> For example, this series from Sasha changes it
>>> https://lore.kernel.org/workflows/20261126171926.2766137-1-sashal@kernel.org/
>>
>> I think this is against Krzysztof's comment:
>>
>>
>>> Then it should be a maintainer profile. We should write docs for humans,
>>> which can be used by agents. Not the other way around.
>>
>> I agree with that comment.
>>
>> But putting that into code-assistants.rst means it's only for LLMs, not
>> humans.
> 
> Please decide to whom you are writing first.
> Almost everything written in your proposal is for LLMs.

LLM will also refer to maintainer's profile, through MAINTAINER's P: line.

> 
> LLMs instructions go to the coding-assistants, instructions for humans
> to submitting-patches and specific to BTFS goes to maintainer profile.

LLM will also refer to that submitting-patches file through the current 
coding-assitants.rst:16.

So I don't know you are pushing so hard to distinguish files for human 
and LLMs.
