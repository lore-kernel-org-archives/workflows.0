Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24CAC61D9B
	for <workflows@archiver.kernel.org>; Wed, 22 Nov 2023 14:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjKVOpN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 22 Nov 2023 09:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjKVOpM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 22 Nov 2023 09:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4C41B5
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700664307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/w99k4ebalupsRXy3umX36OydNbePrrZgl9ysNBYTzc=;
        b=fSarOqK0qKphFHRf0ZR1EXQYnCXPdEG/gLodsVlE38u+tFhnqUdXZdSMjaqdUUV6DtMPJQ
        z07x0gbYrMfBArfCSgnVSSi6qzHrwhlWgUgwZsJYKgDn31316/8lpJ7atGkTMW0S5SlHf0
        vPqkRW8MwsD9Ayk4OouzEu1yGZwDXa8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-zx2Z57WrMCu91Pzob2nSgg-1; Wed, 22 Nov 2023 09:45:06 -0500
X-MC-Unique: zx2Z57WrMCu91Pzob2nSgg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77d55e875aaso257090085a.3
        for <workflows@vger.kernel.org>; Wed, 22 Nov 2023 06:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700664304; x=1701269104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/w99k4ebalupsRXy3umX36OydNbePrrZgl9ysNBYTzc=;
        b=pPRW2c2Pu/U1XTnjO6ugQ77j28tw6PzBK691UG2v/+cvBL/K78wKmiyJ8y/GhCuPhe
         6+IvbkPRnlrRcpSpIOyJPbx4JBGARe34vQEDDALxwZJP1PDAsKQl1CJ5iaDmYTL5qDNT
         ZfM2sAiDLxYvgcilGoH6iwFDqRINNfjNMvFrSK0XF1J0i7x5qZb37R4IE+1fBFK6hH8G
         MVG2d2q5D0UzAUZAP/YwS2geNCr9yHh1js+3KgzNATfQ7DEx83Na8UYWkCewStuKsueT
         kVfvQrB5Fkn4p7fCVId9Ivxy3vCwnucLTbXrlV2ie2S/PfvrcTxuCSUEeWTud2wRkTXl
         tgyA==
X-Gm-Message-State: AOJu0YwH3E+1MqF+fNtrFV4WNvJo49eVsAt9z1fkdZujMG+KG8yJtqsP
        ZMSdoJOHvixFBA8BKSffvAgGFGTiqyRNIAFFDVFOmoxOlJVqfVCtYTUspKWWwSPwic+4nYlDzUM
        ZhdqqIJs3YH36MlB43KD3Xnf2ame8npM=
X-Received: by 2002:a05:620a:1646:b0:77a:6f81:59c1 with SMTP id c6-20020a05620a164600b0077a6f8159c1mr2374231qko.10.1700664304108;
        Wed, 22 Nov 2023 06:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDuHniv0gzYpUJTHcuWjypHxbcwH1q2sUJA7UQdbVeNJCWNMOviHrkiOi8wH8b1NUD9dZweQ==
X-Received: by 2002:a05:620a:1646:b0:77a:6f81:59c1 with SMTP id c6-20020a05620a164600b0077a6f8159c1mr2374204qko.10.1700664303831;
        Wed, 22 Nov 2023 06:45:03 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id pe41-20020a05620a852900b0075ca4cd03d4sm4504015qkn.64.2023.11.22.06.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 06:45:03 -0800 (PST)
Message-ID: <cd2d6ed9-7047-4090-ab44-16540f503087@redhat.com>
Date:   Wed, 22 Nov 2023 16:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] MAINTAINERS: Require kvm-xfstests smoke for ext4
Content-Language: en-US
To:     Theodore Ts'o <tytso@mit.edu>,
        Chandan Babu R <chandanbabu@kernel.org>
Cc:     "Darrick J. Wong" <djwong@kernel.org>, workflows@vger.kernel.org,
        Joe Perches <joe@perches.com>,
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
From:   Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231119225437.GA292450@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/20/23 00:54, Theodore Ts'o wrote:
> So as for *me*, I'm going to point people at:
> 
> https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md

...

> (And note that I keep the xfstests-bld repo's on kernel.org and
> github.com both uptodate, and I prefer using the using the github.com
> URL because it's easier for the new developer to read and understand
> it.)

I already queued a switch to the kernel.org URL, which Darrick has suggested.
I'll drop it now, but you guys would have to figure it out between yourselves,
which one you want :D

Personally, I agree that the one on GitHub is more reader-friendly, FWIW.

> And similarly, just because the V: line might say, "kvm-xfstests
> smoke", someone could certainly use kdevops if they wanted to.  So
> perhaps we need to be a bit clearer about what we expect the V: line
> to mean?

I tried to handle some of that with the "subsets", so that you can run a wider
test suite and still pass the Tested-with: check. I think this has to be
balanced between allowing all the possible ways to run the tests and a
reasonable way to certify the commit was tested automatically.

E.g. name the test "xfstests", and list all the ways it can be executed, thus
communicating that it should still say "Tested-with: xfstests" regardless of
the way. And if there is a smaller required subset, name it just "xfstests
smoke" and list all the ways it can be run, including the simplest
"kvm-xfstests smoke", but accept just "Tested-with: xfstests-smoke".

I'm likely getting things wrong, but I hope you get what I'm trying to say.

> Along these lines, we should perhaps be a bit more thoughtful about
> the intended audience for Documentation/process/tests.rst.  I
> personally wouldn't try ask first-time kernel developers to look at
> the xfstests group files, because that's just way too complicated for
> them.
> 
> And I had *assumed* that Documentation/process/tests.rst was not
> primarily intended for sophistiocated file system developers who
> wouldn't be afraid to start looking at the many ways that xfstests
> could be configured.  But we should perhaps be a bit more explicit
> about who the intended audience would be for a certain set up
> Documentation files, since that will make it easier for us to come to
> consensus about how that particular piece of documentation would be
> worded.
> 
> As E.B. White (author of the book "The Elements of Style" was reputed
> to have once said, "Always write with deep sympathy for the reader".
> Which means we need to understand who the reader is, and to try to
> walk in their shoes, first.

Amen to that! Apart from the newbies and just people working on other
subsystems, we should also remember to be kinder to ourselves and keep our own
tools easier to use. So perhaps just say "newbies should be able to follow
tests.rst", and enjoy it :D

Ultimately, I think the (admittedly elusive) target should be the ability to
just plop a command line into every V: entry, running something from the tree
itself. Meanwhile, we would need the stepping stone of tests.rst, or something
like that, to walk people through whatever setup is required.

I'll see how we can accommodate the commands in the V: directly, though.

Nick

