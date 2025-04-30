Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD5A2C1E21
	for <workflows@vger.kernel.org>; Wed, 30 Apr 2025 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048354; cv=none; b=RJo6hVpp5kMpey4W8eocrqgVDE8wBl3btV2moxKZjR+zEVDtXWpnKbtgn39lvuAgsuhsuP+yra4iVRSRmw0mgf7D7ok4C6NpTABQpCV57tUfmeU85Bd7wrpIsqA48tIWvFl0fiHDD5NyaBpunCHe19LoZZwOp3NhQC9BrR3EzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048354; c=relaxed/simple;
	bh=m0DL8qKn2HJPRt/zk/ogv7PAipQf0Rr3c/trxICPpew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFb32rtjrI4vDY/brlkQ3edlaAGcaZlirmtwg+3YUnkqYIUCV4vpfpgrxOvNhbYRvbSaMv0Yl8n5n0Lr3EN3xWuhqMMGWhk1XzvwenwYSZNfIrCBKSRcx8TQ5N5BsHbhJ/9BEShU4XOWsfCD5qWK+l6SjBYVWATVSSi70q/RpxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F6f0SRn/; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F6f0SRn/"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so5658385ab.0
        for <workflows@vger.kernel.org>; Wed, 30 Apr 2025 14:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746048350; x=1746653150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYRbN+u1XnrHIXA+Wt481EGYDyTsWUWpekmgQbhJw38=;
        b=F6f0SRn/F5Gnnw9z4U5LCTAmUQ66JNVPtP63Kbb0U4/EtkMbiOBAKdg42MWEvHSePn
         xwBqZ01auSveBWaYOyCJ56466URw04H0YjGUK1Qaak18Cn47q4cnCCfXnCSOoTbHOu/v
         m+dXykKkhyHu4pN5MFpCETaUjFOLUoCbHg5fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048350; x=1746653150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYRbN+u1XnrHIXA+Wt481EGYDyTsWUWpekmgQbhJw38=;
        b=ULkdeXxwsvTBKuNth3HM/5OI5/kiVzkBV0u3cVT54NLrAt4VF1dQuo2vCt1wBFM0yo
         1V3iAaXBUZ89QS+SZ6uBrd11CA5eUBPp1GRmd/HGdBEo/epquBxoZfYccVDSyVNb+v+B
         fV+d4mS2nMqT7CwqxMAdd3HWJ84NNawZ2+d/MDb46Wyquhz1Hfjy1R1YPp2njB5g9+ee
         x2kteM1RPSWk6LdTbPOZb8Ekh6tx1watlAPYQcFFag/mB51t+MM4SSKhAkRuCoWcZORS
         6L3/Y1bIof0cWy8KJuRC5CQdA2yr2qqcSNzHTacilEmi/6joQN1ttOMxwtC4Q9XPQK7H
         Ib1g==
X-Forwarded-Encrypted: i=1; AJvYcCVE4g4PiUIE4+cdAPGfo5Pd0gweMbLvtqnqjfk7Z/dZooGr+vQfW92d9hNguLPxdl1ukipqevgoShI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WAvJqMru3/3q/gck5lP/5Gc7hAiHxo3SlQbZt/QKDwrDM0nJ
	5cOhydg7ZOGYLIK+yOmwyu3Mlpd5wsDLsBPKKZCd9uM9qxlOJ6Xzv3gbasHXxCE=
X-Gm-Gg: ASbGncsJ5f8pDTOQ5JVKVN+HBs72LMJOgXDBuvjMbaqK58Rhu65GoBvWgGLKGpM/3On
	VvdRVb3kldf5Uh8Z5AX4LyTzhh0uupwwI8xqegquZRRLO1KAOQtqvunWT/xJQuJ3DeK+72gZRbE
	sGbthcrEjE5E+oUI8P9o6nQ1Sb+ZNrnnB8YcNAXexZ7RpWnweP8z/wUASmtVyFMvKD9I9+jFSok
	q1YWX5KDCXr+AfSFqlqY1pl300c14rRWp0izt5WBBk8/v7rNZzxPlEcusdrRLaNMoqRJoKO88dg
	981CWF1grGV14upTgzMcuxyMhgrx6k0wADS0JJerLNv+qCCwBmU=
X-Google-Smtp-Source: AGHT+IEiiHKVJFhUXHUB3t68KuJgUDxukeIkKP8WUSh1zX997FZQjk44Ybevewxli9cGlS3ksir7lw==
X-Received: by 2002:a05:6e02:3a08:b0:3d6:cb49:1e5f with SMTP id e9e14a558f8ab-3d970a6e9abmr606365ab.2.1746048350065;
        Wed, 30 Apr 2025 14:25:50 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862e831a2sm921932173.40.2025.04.30.14.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:25:49 -0700 (PDT)
Message-ID: <4d1acc28-3645-461a-97e3-316563f468e0@linuxfoundation.org>
Date: Wed, 30 Apr 2025 15:25:48 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: David Gow <davidgow@google.com>
Cc: brendan.higgins@linux.dev, rmoar@google.com, corbet@lwn.net,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <CABVgOSnKPPLH9BASOZ0b3mMOUuiVXxsdXQcoQqyTKd5UYONpUQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOSnKPPLH9BASOZ0b3mMOUuiVXxsdXQcoQqyTKd5UYONpUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 21:54, David Gow wrote:
> On Wed, 30 Apr 2025 at 06:27, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Add tips to clean source tree to build help message. When user run
>> kunit.py after building another kernel for ARCH=foo, it is necessary
>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>> during the build. In such cases, kunit build could fail.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
> 
> Thanks for doing this.
> 
> This looks good to me, save for the issue below.
> 
> I do wonder whether there's a more general fix we can do in the
> makefiles, but I'm not sure how that'd have to work. Maybe by storing
> the architecture used somewhere and amending the error based on that,
> or hacking around the specific x86_64/UML incompatibilities. But let's
> go ahead with this fix regardless.

I agree the right fix is to see if kunit.py can suggest the right arch
to clean. I will take a look at that.

As you said, it is good to have this documented in this series.

> 
> Cheers,
> -- David
> 
>>   tools/testing/kunit/kunit.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
>> index 7f9ae55fd6d5..db86a396ed33 100755
>> --- a/tools/testing/kunit/kunit.py
>> +++ b/tools/testing/kunit/kunit.py
>> @@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
>>                                                  'the options in .kunitconfig')
>>          add_common_opts(config_parser)
>>
>> -       build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
>> +       build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
> 
> Because this string is enclosed by single quotes, the 'make ARCH=foo
> mrproper' is not part of the string (and there's a missing terminating
> quote as well).
> 
> Maybe change help= to use double quotes, and add the missing one? Or
> use double quotes or backticks for the make example?
> 
> 
>>          add_common_opts(build_parser)
>>          add_build_opts(build_parser)

Thanks for the pointers. I will go look at those to make this
help message coded better,

thanks,
-- Shuah
