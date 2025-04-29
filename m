Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8B2BF3F6
	for <workflows@vger.kernel.org>; Tue, 29 Apr 2025 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969682; cv=none; b=u/d1zeRBu6lIfV/ppK0MDzFB3/Jdt+bU6WlD1rVhJIhbhl7fkbyjV2qJhnsJgghQt+rGzrC4UGTAkK58zdbFKtc+3nOkaSB507Amp6lL3jaVzU6nCbEIc/4F4bUI7m9BKyf9WT+kZVf3qQyd1T+akVNNRvV994btla1ypw+nYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969682; c=relaxed/simple;
	bh=5PpGCLInumY79oCa5QN8pCEtkY3g3aL7RVIL8qW8exs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLEE1W0wPIeJRgr0Dw4nHLdDTUDxCo29HbYah4i98w4BO3Ixb2llt4n+OBY5lTvUpbUT/wXcohlXn/g7+STHJwiAqE2PDKg8AZG18dUoUrHYiQU83QX0mXpLrhK/W/KdvHUZbLylOojP3Naa/GnTtE0ZRWBQBl1KaeBgo3+e3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIjXBDyF; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIjXBDyF"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so32232195ab.3
        for <workflows@vger.kernel.org>; Tue, 29 Apr 2025 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969678; x=1746574478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=FIjXBDyFl88sVU3HjaMuUwgelG7rsXRL05jT7yq7qmgYDFCRzIUGkqQBIruLmN2DoF
         agR23e3CeQ8m3xUBTJYcQ55vkNL/QIQcfTR1h7r+Z0zmQrb1hY4wZEeUCoFZwq5S4bEd
         CGoamXcOdUOqGF/Tk7w/hWcnH/lcA6zD11GjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969678; x=1746574478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=QuHf0mXeyQmZDc9C89WuKpWklmYIzij63hMdjr3VdVy0+JFmIjp6sz174lzs4sgxv5
         HZtnn7sFJ+Wz4wCZ0rtpfLFE/Deri0O20bW9Wlp/oLznGZh+hBzrrQ9b9US8uv6aMyk1
         VYvddQDK6UEPEg0VLJHqpxSm6V4dYn/morskA8gSL9/6kuzxnx8eaAxvdt+qocF2cW0b
         bodiZ/Uy4cbW9u2b699n3nlR8TydPfrSi0enWLBsYtDzV2ZzYezA5lheZzZ8MX/RLSYX
         YKcYshsWj+Gxv96bfSsT+JwAftOJEh5W/jqMm5PdNePsP/49INOj0ZXiteE7bhelF6Gd
         +UKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxzw9Y81QGtxRkZjCAL66fs0mrSBTKs/72RB1NRbRU0kl4u4s1sWYPZHpjCRFCHJsPZyLPKGqsaQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJNhxEmLny3u+9QdLyfQ4SpsIToAwYQMLCuVGsAIlN3EZkwAv
	yi1SoyyUUJg+TirgPiHSKgSRvV2Fapi6+eMKWg2JUrqYoJv0JA1fFA1QOg1Yup4=
X-Gm-Gg: ASbGncu7GCW9Ug8v6J6/NxxmgRy0F8VobIjLRTy+MTzdCgSHiaxPvAHzbyZUzQ/kWBO
	X8wkAzizlcCpRQOBU3S2O5BcDPkxakMMrIruAuIJD+G2wK2FsSpBGACy7xGytBiP0h1s8DJ0PyF
	bgvFeqpItSVdYXBAxFlBQnKHKKvdIssDwHZEB3m6xHpO1ANOAUhTdXaDesqj5hDQvvnx1nxxz5o
	8obkYYmIFStfML9RziFY5x+N5apevird55SS/B8YEFaNU0ZzEaE1I0Y0+u7mLZ6AryZ5TcBcz9M
	95BttNMn2gJc1CJFpxhjBMJh0cHrvtdiy0bEOsmtcLumiAFpUt8=
X-Google-Smtp-Source: AGHT+IGOjy3LeocKf8YYHPxXWO9DsgVyLTc1222evmd5AAMOYmg3KWF6p2nXzH2m9ZsGo+Z4im+xEw==
X-Received: by 2002:a05:6e02:1a0d:b0:3d0:4e57:bbda with SMTP id e9e14a558f8ab-3d967fa17f0mr5478365ab.1.1745969678668;
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f48030asm5366935ab.70.2025.04.29.16.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Message-ID: <9477f8e9-b17b-49c3-a957-849198251082@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:34:37 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: Jonathan Corbet <corbet@lwn.net>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <87selqlh0q.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87selqlh0q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:49, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> Add tips to clean source tree to build help message. When user run
>> kunit.py after building another kernel for ARCH=foo, it is necessary
>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>> during the build. In such cases, kunit build could fail.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   tools/testing/kunit/kunit.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
>> index 7f9ae55fd6d5..db86a396ed33 100755
>> --- a/tools/testing/kunit/kunit.py
>> +++ b/tools/testing/kunit/kunit.py
>> @@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
>>   						'the options in .kunitconfig')
>>   	add_common_opts(config_parser)
>>   
>> -	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
>> +	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
>>   	add_common_opts(build_parser)
> 
> Nit: could perhaps that line be broken in a bit more readable way?

> 
>    	build_parser = subparser.add_parser('build',
>          	help='Builds a kernel with KUnit tests. '
>                    'Successful build depends on a clean source tree. '
>                    'Run mrproper to clean generated artifacts for prior '
>                    'ARCH=foo kernel build. '
>                    'Run "make ARCH=foo mrproper"')

It improves readability. Will fix it.
> 
> (fixed "artifacts" while I was in the neighborhood :)

Thanks for catching it.

thanks,
-- Shuah
