Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1AAC61D9B
	for <workflows@archiver.kernel.org>; Wed, 22 Nov 2023 17:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjKVRoi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Nov 2023 12:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjKVRoi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Nov 2023 12:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DAD9A
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 09:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700675073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z5lOHzNfXo9jQJ5tg2RkdaViH4dDlpDTOZxGJF246r4=;
        b=KoDkux9/wgI+0/M4wm6UZeJOr4K7to0wVbp2O32fqoopJtie3PTrCZ8yTO5cwoR4zGIVJE
        YTHBE7ARgPPEOI/RUQN/VXy1MxBh21fxvGhJ4X8A0YfmPuJaxjCuUGfzNM1MHkIsfBtxu8
        hE+6VQR4hJV0l3IFeI6MRQdF8QM74Vo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-3Unfah4jOAeFVgjvhXcrrQ-1; Wed, 22 Nov 2023 12:44:32 -0500
X-MC-Unique: 3Unfah4jOAeFVgjvhXcrrQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41ea8e21785so1201381cf.1
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 09:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700675072; x=1701279872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5lOHzNfXo9jQJ5tg2RkdaViH4dDlpDTOZxGJF246r4=;
        b=IsK1fq1fNwohflq/+QBd8L17no0KQu83vFUDAT/GPWi7QSqV9BEJ9Af3m72xanox37
         x6pvIFRFYBvQLdw4A9ZKTEEEJ04zwHAJEksHc4ns2anUbpS7yHdBdNNjU+ldyvFaUKZJ
         mOOf4ero5uQ3jTAvZAinJYjzivyoPIzqVyLR8GG6SJpZDayLcCroE+WQZUraajj0yiHR
         g7/qAATGEKOWXDNy9o3PC9bhLHKBSymoW/dGlcTRhMgHMAkZ0Z4nWkfDYTzr6z4995Hg
         sTGacsANdDNcFLs+xRfSk/8xE7ECRE/VKI36vK+LYYGsyrjVa7Lu5HDhc49t1nR0LN5Q
         tyug==
X-Gm-Message-State: AOJu0YxlJ9pVwUPWIZF0qBOY6qydIXaiYOtPVDv8TOMDRa74YCvydJqe
        8hRauJHKSRsE9f7+DqggmkM6qid34JTTBfm9I1VCKaHXbkPuYNhoWRdFOXK3/v0EEMBM37JcxwJ
        u7DHPw28/zLFx7S26yR5NhtZKKv5EKxI=
X-Received: by 2002:ac8:51c9:0:b0:3f9:aa80:b48a with SMTP id d9-20020ac851c9000000b003f9aa80b48amr266202qtn.8.1700675071781;
        Wed, 22 Nov 2023 09:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEswk2Ukh1tn1H1mnSGmVcXNR1Gd8/lMKUbZkOe2oc6oAY0mfcDn6I/97xKBvGL3mF2zqL3OQ==
X-Received: by 2002:ac8:51c9:0:b0:3f9:aa80:b48a with SMTP id d9-20020ac851c9000000b003f9aa80b48amr266182qtn.8.1700675071483;
        Wed, 22 Nov 2023 09:44:31 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id c15-20020ac87d8f000000b0042382bfae48sm346734qtd.76.2023.11.22.09.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 09:44:30 -0800 (PST)
Message-ID: <8573add2-73db-4783-be90-389a2f076ea9@redhat.com>
Date:   Wed, 22 Nov 2023 19:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] MAINTAINERS: Require kvm-xfstests smoke for ext4
Content-Language: en-US
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        Chandan Babu R <chandanbabu@kernel.org>,
        workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Dave Chinner <david@fromorbit.com>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-3-Nikolai.Kondrashov@redhat.com>
 <20231115185808.GD36211@frogsfrogsfrogs>
 <87v8a096cr.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20231119225437.GA292450@mit.edu>
 <cd2d6ed9-7047-4090-ab44-16540f503087@redhat.com>
 <20231122161746.GM36211@frogsfrogsfrogs>
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231122161746.GM36211@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/22/23 18:17, Darrick J. Wong wrote:
> On Wed, Nov 22, 2023 at 04:44:58PM +0200, Nikolai Kondrashov wrote:
>> On 11/20/23 00:54, Theodore Ts'o wrote:
>> I already queued a switch to the kernel.org URL, which Darrick has suggested.
>> I'll drop it now, but you guys would have to figure it out between yourselves,
>> which one you want :D
>>
>> Personally, I agree that the one on GitHub is more reader-friendly, FWIW.
> 
> For xfstests-bld links, I'm ok with whichever domain Ted wants.

Great! I just hope I can keep track of all the requests :D

>>> And similarly, just because the V: line might say, "kvm-xfstests
>>> smoke", someone could certainly use kdevops if they wanted to.  So
>>> perhaps we need to be a bit clearer about what we expect the V: line
>>> to mean?
>>
>> I tried to handle some of that with the "subsets", so that you can run a wider
>> test suite and still pass the Tested-with: check. I think this has to be
>> balanced between allowing all the possible ways to run the tests and a
>> reasonable way to certify the commit was tested automatically.
>>
>> E.g. name the test "xfstests", and list all the ways it can be executed, thus
>> communicating that it should still say "Tested-with: xfstests" regardless of
>> the way. And if there is a smaller required subset, name it just "xfstests
>> smoke" and list all the ways it can be run, including the simplest
>> "kvm-xfstests smoke", but accept just "Tested-with: xfstests-smoke".
>>
>> I'm likely getting things wrong, but I hope you get what I'm trying to say.
> 
> Not entirely -- for drive-by contributions and obvious bugfixes, a quick
> "V: xfstests-bld: kvm-xfstests smoke" / "V: fstests: ./check -g smoke"
> run is probably sufficient.
> 
> (Insofar as n00bs running ./check isn't sufficient, but that's something
> that fstests needs to solve...)
> 
> For nontrivial code tidying, the author really ought to run the whole
> test suite.  It's still an open question as to whether xfs tidying
> should run the full fuzz suite too, since that increases the runtime
> from overnightish to a week.
> 
> For /new features/, the developer(s) ought to come up with a testing
> plan and run that by the community.  Eventually those will merge into
> fstests or ktest or wherever.

Of course, makes sense. Thank you!

Nick

