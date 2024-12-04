Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7458F5E
	for <workflows@vger.kernel.org>; Wed,  4 Dec 2024 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733273808; cv=none; b=TYIvthkZRXZkCm5VCLVzNY6k4edlzejP64Swvf8ntLfR8sl2JuPfPkajcBjKyOMjKZp5uTXE1/Qh6YM4aSaS1AxxiAeRXeCXwnRosaEUVXsqNsv53ycTo0gonOIS7+h+vHLjqTUd8vsx4Y8J2cJ5Pw1hIs6byAWlwHelRe6Iddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733273808; c=relaxed/simple;
	bh=njeG8iD6mfq353aOT/B6XJHoA7kAILspGLzemTxfWk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBC1Pstq4DIxWI6szEsCML2vLiuANNvZ5/sVyGyuMzgTxPNgjC95MSVtjsTFeeqNu15SPJgfbw2PUKj4LOhVN/Ik7qmKsdwcggJiq0q2zAqLJLKdeX+isyhYff5SLGU4hGTLOH37DiZ9KRnzd/AEGY2NwyRQeT6k0VaRvqVCw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BQj0VArR; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BQj0VArR"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-843e3b49501so199234839f.0
        for <workflows@vger.kernel.org>; Tue, 03 Dec 2024 16:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733273806; x=1733878606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00R01WB09ikJ7TfGUNEYyTuGf2VppHlK5EcxdhhTed0=;
        b=BQj0VArRpjvx6EMIW4Xx0q2SI1Od9gsesH3sNiUA3ZpEZ+s+W7jl/NxATj54ZzNx/2
         uU41sHaCfLhKWbiukYDeihhIKypLZ79AevVB4VWpy3Hbgqg4NLK1pUEH8KbVSq07njs9
         j6vIrEs88gi3GKF3ASAB7+DkoiJLZxMU2igIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733273806; x=1733878606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00R01WB09ikJ7TfGUNEYyTuGf2VppHlK5EcxdhhTed0=;
        b=gKhe2ZxBW4hbkmd0Hz2MXdjOzv0H2X+AY17SulzBeiBfg1soMgNpHXGj8AdY/2EfNG
         LcXCtgGCjZYLuOT51TW/iVA6AFXXJPxcQmXxvKWcPPdq0gT1Ys05Ee5rZJNNnfinuPRE
         GFfvxetFk3m3MZMcDCotcMCbQfxHdQxs3CBP/GGmLfJWGyy7U2YlSGkjOZOTqt2NQFCI
         ZFQ915PHthkj8eBiYDvLPDY2j4WDfjoeAXoR8kZjdd7jzZaY3U0xMOGacX7GDTb/bLnD
         avIt3D/04UuVO1io8zN0bh93NP+vY/JT9EIXGx0cwcmQ3OP6oSVZbToYKfwGS0XdA3+7
         PQgA==
X-Forwarded-Encrypted: i=1; AJvYcCXaNv89zMmf5I6xsoo6A0XXCnVTrXguGQYhOXtr08/TvK9E3JlGLUjJT9pN1lR8iMeUTOgd/l07i8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVaSe25x5vnuT+RXMyEbUFXNpmfkJXrwFFRsAgQTo2fPaIClNM
	qhGyDldcXDgJR3Gn6CHSAU1X1v3nnpjZ2O/dC5Tohn7ssF/6FdYjMD+CRGUEwvs=
X-Gm-Gg: ASbGncuSW4yXTwMGPlq8PzCnf/c2R82A2jzMTn2sOasqjS5N2PR0IPLXRbzFdSc3+9u
	Lu04YCHNsM/nE2+ygCyW0cNIfek2LyNC5ehyc7HMxsoYAMCxDJlr8gme4Yx3Mw3qEMsG3lOmN2I
	3vp2OOLsFuaahI2hdn8Yv6dtSWI2+GmoSOm4IILnIPeQCHfBAy1+weYnDijLZoOsW+ERaZTFx4a
	/OqX3A4XhIBHSaFZeTOjZYwVKPvWlwr2x17kH8iA9EpxVLiZHkj5bKQfD7wnw==
X-Google-Smtp-Source: AGHT+IH+PqwQh1gs7efqVjznnXTs3fzgoxUSDkb9HL2ZMsz1+TCwuZ+tPfsuHqLHTOq0KW/t/IoH4A==
X-Received: by 2002:a05:6602:3405:b0:841:a1c0:c058 with SMTP id ca18e2360f4ac-8445b577d49mr667540039f.9.1733273805753;
        Tue, 03 Dec 2024 16:56:45 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84405f11824sm273367739f.30.2024.12.03.16.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 16:56:45 -0800 (PST)
Message-ID: <6288979d-3024-45fb-ba8c-f4c22149ae9a@linuxfoundation.org>
Date: Tue, 3 Dec 2024 17:56:43 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Make Helped-by tag supported
To: Matthew Wilcox <willy@infradead.org>, Dragan Simic <dsimic@manjaro.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Jonathan Corbet
 <corbet@lwn.net>, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, wens@csie.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1730874296.git.dsimic@manjaro.org>
 <87h68k4esb.fsf@trenco.lwn.net>
 <cabfa180845df30bfb7a541a701a57e9@manjaro.org>
 <672e628111eb0_10bc629436@dwillia2-xfh.jf.intel.com.notmuch>
 <28c0a0ecc2e2880e4cb98449767e2842@manjaro.org>
 <9ae99d14dcd8867333fceacfaaa4430a@manjaro.org>
 <Z03qJKpjBqJ9vAhY@casper.infradead.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Z03qJKpjBqJ9vAhY@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/24 10:11, Matthew Wilcox wrote:
> On Mon, Dec 02, 2024 at 04:00:47PM +0100, Dragan Simic wrote:
>> On 2024-11-09 04:10, Dragan Simic wrote:
>>> On 2024-11-08 20:12, Dan Williams wrote:
>>>> Dragan Simic wrote:
>>>>> I'm fully aware that we may be reluctant to supporting
>>>>> additional tags,
>>>>> because we may then end up with a whole bunch of strange tags
>>>>> that might
>>>>> be a bit hard to understand and use properly, but I think that adding
>>>>> Helped-by to the supported tag list may actually be a good thing
>>>>> to do.
>>>>> As described above, Helped-by fits very well between the Suggested-by
>>>>> tag and the Co-developed-by + Signed-off-by pair of tags, and I think
>>>>> that providing the right level of attribution may be beneficial.
>>>>
>>>> Patch attribution is separate from giving thanks. I would much rather
>>>> someone take the time to say "Thanks" in the changelog with some
>>>> supporting text rather than boil down all the myriad ways to be
>>>> thankful
>>>> into a generic tag. "git log --grep=Thanks" often yields valuable
>>>> details, beyond just attribution, on how people have helped each other
>>>> develop this global project of ours. If the introduction of Helped-by
>>>> would replace even one authentic "Thank you" note with a generic tag
>>>> then it is a net loss for the community.
>>>
>>> I do agree that writing "Thanks John for helping with..." in a patch
>>> description would be nice, but unfortunately I've seen multiple times
>>> that people don't enjoy writing their patch descriptions at all, and
>>> just want to "get them out the door" as quickly as possible.
>>>
>>> With that in mind, making Helped-by tags supported would allow such
>>> people to at least quickly mention someone they're thankful to, which
>>> actually wouldn't prevent anyone from saying the same more verbosely
>>> in a patch description.
>>
>> Just checking, are there any further thoughts on this patch?
> 
> I agree with Dan & Jon; we don't need this tag.  And if someone's doing
> a poor job of writing commit messages, they need to be helped to write
> better ones.
> 

+1 on this. I don't think we need yet another tag.

thanks,
-- Shuah
