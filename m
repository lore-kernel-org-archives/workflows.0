Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A498C61D9B
	for <workflows@archiver.kernel.org>; Wed, 22 Nov 2023 17:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjKVRiZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Nov 2023 12:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjKVRiY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Nov 2023 12:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7ED11F
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700674700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wCirk8wMzZUyQ6zcKj2cOOG81MWIHNS3qpPYhZ0C5Oo=;
        b=ade5N826pHU0RvWsR1kjuTvR7BvcPE1htp7UpiAoNpEfglqz9HrGzvxAHgjrYq/EPqkmiB
        4rSwNxyHSmsBd4Sz5YFcXQ4aZ/GSIpQrJiz5D0sD7wDQIf44Igb2/+9ArYjCqcEu4mmek0
        6xgq0OPFUMYcn7PjHVUpblf4h7/0v1k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-o0CF9gHGNvmMHh9QCrDbyQ-1; Wed, 22 Nov 2023 12:38:18 -0500
X-MC-Unique: o0CF9gHGNvmMHh9QCrDbyQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-77c067efb88so10278085a.1
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 09:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700674698; x=1701279498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCirk8wMzZUyQ6zcKj2cOOG81MWIHNS3qpPYhZ0C5Oo=;
        b=XViBJN9kTbk4Aan9a1sNHprv3aFGVeiD4XkcMYZpGfPbw6fKI3vJAooc7I+5Ce4OKK
         +63Wsx0GyK2BWNwRAPbpgjBXTJCfb/Bv96gCUYRd3FmhmBh4sF/G3M7oMvzTkAft6rZT
         NAMbO4IDilhef/Oz7/HkoTO7gFKghKaTbilAbja+gaa1MmfUZ3tKBN+wKpQG3+W5yFWP
         2QSZ6ZQhWy7/sFghxnWiwWfn/iq7kxGe83iX2rZsse6ZO+kbweZNMJAP0Era+1SxUuSX
         dZYq0u//7VQLvTFwH5fKPM61oGORrOaVGW0KNOU57Yx8J8+3KmW1vxxw1gKBuJjLUV/R
         bkWg==
X-Gm-Message-State: AOJu0Yxr84w5giYx6u4fLwoiuIMicZHuGx7jMxcm1erawiNyES04CLtN
        +fXw7I7nIv+93fmCXb5U0Ouy0b/HDLTLTBhIVSXJTYkyXCw4jLPYfOB1AAwy+Nb+GoHvV+B90io
        GpH3INqpXmE4shoGMvHDF
X-Received: by 2002:a05:620a:8190:b0:77b:bfc4:4e13 with SMTP id ot16-20020a05620a819000b0077bbfc44e13mr218777qkn.18.1700674698048;
        Wed, 22 Nov 2023 09:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcVCRtdLK+GqZbNkCFqYSq1Z8hTiwfO/3vOTUgNhaVJU5KS3DJFogXkBj+W0DSlCUWyTgnlA==
X-Received: by 2002:a05:620a:8190:b0:77b:bfc4:4e13 with SMTP id ot16-20020a05620a819000b0077bbfc44e13mr218745qkn.18.1700674697767;
        Wed, 22 Nov 2023 09:38:17 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id oo4-20020a05620a530400b0077d5e1e4edesm32579qkn.57.2023.11.22.09.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 09:38:17 -0800 (PST)
Message-ID: <ac688ab2-b8b5-42d2-9032-cf23eab6aeed@redhat.com>
Date:   Wed, 22 Nov 2023 19:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] MAINTAINERS: Require kunit core tests for framework
 changes
Content-Language: en-US
To:     Daniel Latypov <dlatypov@google.com>
Cc:     workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-4-Nikolai.Kondrashov@redhat.com>
 <CAGS_qxpfnQ6kmanEUQWosuixo+FGUxp3VJ_TSjBdRf_p9riTSQ@mail.gmail.com>
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <CAGS_qxpfnQ6kmanEUQWosuixo+FGUxp3VJ_TSjBdRf_p9riTSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/20/23 20:48, Daniel Latypov wrote:
> On Wed, Nov 15, 2023 at 9:52 AM Nikolai Kondrashov
> <Nikolai.Kondrashov@redhat.com> wrote:
>> +kunit core
>> +----------
>> +
>> +:Summary: KUnit tests for the framework itself
>> +:Superset: kunit
>> +:Command: tools/testing/kunit/kunit.py run --kunitconfig lib/kunit
> 
> Note: we'd want this to instead be
>    ./tools/testing/kunit/run_checks.py
> 
> That will run, in parallel
> * kunit.py run --kunitconfig lib/kunit
> * kunit_tool_test.py (the unit test for kunit.py)
> * two python type-checkers, if installed

Noted, queued!

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f81a47d87ac26..5f3261e96c90f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11626,6 +11626,7 @@ L:      linux-kselftest@vger.kernel.org
>>   L:     kunit-dev@googlegroups.com
>>   S:     Maintained
>>   W:     https://google.github.io/kunit-docs/third_party/kernel/docs/
>> +V:     kunit core
> 
> Maybe this topic should go in the main thread, but I wanted to call it
> out here since this is a good concrete example.
> 
> I'm wondering if this entry could simply be
>    V: ./tools/testing/kunit/run_checks.py
> 
> And what if, for ext4, we could have multiple of these like
>    V: kvm-xfstests smoke
>    V: tools/testing/kunit/kunit.py run --kunitconfig fs/ext4
> 
> I.e. what if we allowed the `V:` field to contain the command itself?
> 
> # Complexity of the tests
> 
> I appreciate the current "named test-set" approach since it encourages
> documenting *why* the test command is applicable.
> And for a lot of tests, it's not as simple as a binary GOOD/BAD
> result, e.g. benchmarks.
> Patch authors need to understand what they're testing, if they're
> testing the right thing, etc.
> 
> But on the other hand, for simpler functional tests (e.g. KUnit),
> maybe it's not necessary.
> Ideally, KUnit tests should be written so the failure messages are
> immediately actionable w/o having to read a couple paragraphs.
> I.e. the test case names should make it clear what scenario they're
> testing, or the test code should be sufficiently documented, etc.
> 
> # Variations on commands
> 
> And there might be a bunch of slight variations on these commands,
> e.g. only different in terms of `--kunitconfig`.
> We'd probably have at least 18, given
> $ find -type f -name '.kunitconfig' | wc -l
> 18
> 
> And again using a kunit.py flag as an example, what if maintainers want KASAN?
>    ./tools/testing/kunit/kunit.py run --kunitconfig lib/kunit
> --kconfig_add CONFIG_KASAN=y
> Or what if it's too annoying to split up a larger kunit suite, so I
> ask people to run a subset?
>    ./tools/testing/kunit/kunit.py run --kunitconfig lib/kunit <suite_glob>
> 
> 
> P.S.
> Tbh, I have always hoped we'd eventually have a field like
>    V: <one-liner test command>
> 
> That is part of why I added all those features above (--kunitconfig,
> --kconfig_add, glob support, run_checks.py, etc.).
> I wanted kunit.py to be flexible enough that maintainers could state
> their testing requirements as a one-liner that people can just
> copy-paste and run.
> 
> Also, I recently talked to David Gow and I know he was interested in
> adding another feature to kunit.py to fit this use case.
> Namely, the ability to do something like
>    kunit.py run --arches=x86_64,s390,...
> and have it run the tests built across N different arches and maybe w/
> M different kconfig options (e.g. a variation built w/ clang, etc.).
> 
> That would be another very powerful tool for maintainers to have.
> 
> Thanks so much for this patch series and starting this discussion!

I'm a bit squeamish about just letting commands into the V: fields, as it 
hurts discoverability of the documentation (or even just a simple description 
of what the command does), and then checkpatch.pl would have a problem 
identifying the modified command in Tested-with:.

OTOH, we're all hackers here, and I understand where these arguments are 
coming from, and as I said in other branches, I think command-first should be 
our ultimate target, not instructions-first. Also, if each of these commands 
supports the -h/--help options and manages to make sense in their output, it 
makes things somewhat better.

All-in-all, I think we can have both the already-implemented "V: test name -> 
catalogue -> command" route, and the "V: command" one.

Something like this for the commands:

     V: tools/testing/kunit/run_checks.py

and

     V: "kvm-xfstests smoke"

for test names referencing the catalogue.

Then make checkpatch.pl verify only the presence of Tested-with: tag for the 
latter, and leave verifying the (more fluid) commands to humans.

Thanks for all the comments, explanations, and details, Daniel!

Nick

