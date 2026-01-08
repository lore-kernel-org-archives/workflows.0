Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E52D7DC4
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767905155; cv=none; b=ey3mymWUVE5tK2qe10Qkc8saJAAxMxZE+ow5kG0eDpslKIzEyTH5m8kcE1B+JjFYkeGiO4lPSjr4Hm6sr0cmwOyiSe2kRXaypEIFafYIlL5V0PusICW8ZoMbPQDZJvUjSO8ansIufPz/AwLlFILCvcxfTvWcaPd7U5Cd2mVvUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767905155; c=relaxed/simple;
	bh=a31PE+KmmFRwXfnlKJC4zTat6x7aTajW4NTP2SqfUQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVJ6+wFCm3H7KoO/qEjDUs/0a4C9v7flgp5Vc6tMRWkGKP8Ntpxkxnjvfa3TUtmrptOPQGybvZKH5w75tzUIF7MTQGkJCcuFW6m2mN4FTOp2KWBCSdWsobYQAmvYFaXSapcDAhhOvxneWaJmAkKA7/Jv9Gkm2kkGHhBZNKM/0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=m0QUkDYE; arc=none smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="m0QUkDYE"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-3ff4acb6eebso2195998fac.0
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767905151; x=1768509951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6zUMN/EGP8eMs0aX+0WOCGJSD0vj1CBl5LlanzlFek=;
        b=m0QUkDYE942+C5H01sx1duQC0IJSLrabGC85c78JFXB9P1GQPELTZi3iwFVZZfZP9I
         PH/g3EFNJsFJqvX7cdAYr0/NgIm1pxBWQXCzJ+Mr0OV2C0wOZKBDTAvX04NAPnQ2CKxB
         jb3asa6iiCJ5ieS+GQPDedR4sR8OcJB3TGkYSCAqC5sa1NjKT0y6NpsFUs0AbUgFtkFT
         zOXGBnnA7zD2bj6hGfcJwWSNm56Y0sSKPfsanMpQhND6T055uOE674T8+2F/+CvTkbZW
         LFXiNdqGXZWugIJJrm4A6IXakxI9+YTeW7PV8qLUY7O7IXxLcujg+4FmRTb5mQALe1YT
         nvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767905151; x=1768509951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6zUMN/EGP8eMs0aX+0WOCGJSD0vj1CBl5LlanzlFek=;
        b=OdhHQDXOLlIjP+AizghB7ClztCjD7t/9dV9B4Ld3V7OAMLaW/qf7gOsid8ijuwBARq
         p72ZODA9bpFDJ9Gg4nrtgXuqqM2HMRaV8nUpKQIQruwXGxkAbO1JIFaxaIeOiLtXHH8p
         ijLi8jQEaiycvZshVTsYSOcRKSxohW7ZpRtmykf4/o9dpxgci9a8NA0aMB6pdVv737fy
         N6oOO4Z71Ng1PbMQTmJSMr1Pr8fUBBR5zBdS9JExJxDyIyvPAjr3+XPgGjet6BAetyiv
         FttumjDDZCsPJYI0PdtQYjhEhisYWDfbYKympgblFugAyex9nMaUtRFXBjTxLz8dJKDO
         RFeg==
X-Forwarded-Encrypted: i=1; AJvYcCVfd7MTJpnbubbyYn0JKcPf4+3/d0kPQjx9ME5uhyexlDpLSD1fmCJuCn05ShQ/MAHe4p7X/6VETS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5YZe5tBgxWux6Bsvrbddgs9qrAAxc7hwDOJVmbsS8PRS3QTv
	RdsDVJDVuqLhOMBYoBSGyEsRMD3j1XIFCQg2RwLVfKudYJ/EUj6+0OB5kY7vma/a8Co=
X-Gm-Gg: AY/fxX4Xn0LOKBJiLWfa9NrfN6Bv0mlDGGFV/eEfPqu0KQBDQJ5nF/f7O6tAaQRZOf6
	XzeA7SIhNWMfRFQUgK0utOqShuUgzzj2eYtc9m9qwbXVv1lzGPoXbou2fFv4Q8hMe1a8xTm3bi1
	VL+O5WhKitJlVRTkDLVPuqBwQ2fzmibpUHLwPzWlIopZJQXxJuZ2p8tAY6wQD5+RiytHEAU+duI
	slfozlWSlIcL22XbuZRyqXYEOC8OzXHrMmHNhBRruV3cnVqW6n/U8fD8i5HXHs4U+XMRXS5RqBL
	kzUEYZSMqBTZPBgNIBUDNBjt+kdzPXXxuxWFfGQ/vgfYSJ9UJqKsCuJ48UDwJDhDLH9JuKH5LpH
	UnRBgNyUvgEQLhT587RZcVQpsiBy7Yj8loYyU+bM6MT3oHi/FavXzeJpttVNlZrdOvG8GAcY41Y
	Svk/BZbHv7fCIujqw61oA=
X-Google-Smtp-Source: AGHT+IH0/MjgH9VE+wIVXmuw+NAnDw7hQ7uK9TlclrIg9b9O8SUUcvRvJc3q3qjWPeRksMKVCb02zA==
X-Received: by 2002:a05:6820:1501:b0:65e:f0f9:aa5d with SMTP id 006d021491bc7-65f54f4f816mr3174039eaf.40.1767905151369;
        Thu, 08 Jan 2026 12:45:51 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48beb796sm3567472eaf.7.2026.01.08.12.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 12:45:50 -0800 (PST)
Message-ID: <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
Date: Thu, 8 Jan 2026 13:45:48 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Steven Rostedt
 <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
References: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
>> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
>>   - Ask the submitter to explain in more detail about the contribution
>>     so that the maintainer can feel comfortable that the submitter fully
>>     understands how the code works.
>> +
>> +Finally, always be prepared for tooling that produces incorrect or
>> +inappropriate content. Make sure you understand and to be able to
>> +defend everything you submit. If you are unable to do so, maintainers
>> +may choose to reject your series outright.
>>
> 
> I feel like this formulation waters it down so much as to lose the emphasis
> which was the entire point of it.
> 
> I'm also not sure why we're losing the scrutiny part?
> 
> Something like:
> 
> +If tools permit you to generate series entirely automatically, expect
> +additional scrutiny.
> +
> +As with the output of any tooling, the result maybe incorrect or
> +inappropriate, so you are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, maintainers may choose
> +to reject your series outright.

Eh, why not some variant of:

"If you are unable to do so, then don't submit the resulting changes."

Talking only for myself, I have ZERO interest in receiving code from
someone that doesn't even understand what it does. And it'd be better to
NOT waste my or anyone elses time if that's the level of the submission.

-- 
Jens Axboe
