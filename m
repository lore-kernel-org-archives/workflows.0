Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CE4C47404
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:50:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05E82206B6
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:50:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfJIVul (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 17:50:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49442 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729161AbfJIVul (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 9 Oct 2019 17:50:41 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 66FFA99C48
        for <workflows@vger.kernel.org>; Wed,  9 Oct 2019 21:50:40 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id y10so3606437qti.1
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 14:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fho2dkN38+31aiTslm6EpqrFn8XIUNhwTLYZWAhsXHo=;
        b=jq6/Sm9GYvpy7bG0t6fDph6cNGP40fi12f0eN+W2TUc0vf5qe3mHB/70e3DZ+QSB41
         2hvaj8joJj5BHILPBIxXu/o3juzWkIgKOfZPJSbx1T+rVxV8lCOslDSAeU570jRVgvJH
         FFkXf/Rqh4vgDoZAXEGsxPLtHsmLTWLu87v25n6MtfNpsI/IOX+KYeCd/VeRyfjEmXq4
         AcKrnLCX4ED80AdssM6KnqxAD+LVz3S5c5sPRKL4h3kEyJA/OjPoEyl+VGXZjz3ew0d2
         PW4s1G5zjsd95ASUrpX8b1Pr6HLFKoDWiXdnaa4QC4x0O6Av542bfgO8/Z10o1KhNfzx
         Q9ig==
X-Gm-Message-State: APjAAAXikcXIXLcc2xx/8XQJcA2MJaEXpLnCrFn53+t2+YbjmZ6NM1hW
        kmemesCHyPNEhgv1fIx5JbOKW4nGODG2cclQTMMXizJDyP88jafUVrCS+bJjnecXLelbS5D0MQc
        z5ZKEY9ocwkMP1e305jK3
X-Received: by 2002:a0c:8003:: with SMTP id 3mr6221462qva.161.1570657839078;
        Wed, 09 Oct 2019 14:50:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjlQCfviaUSWdwxp8KiJkf8A/22+anIfUyjfSDqPPzRRkbgBSRLJnaKfpBn7TfsuokimQEWA==
X-Received: by 2002:a0c:8003:: with SMTP id 3mr6221419qva.161.1570657838490;
        Wed, 09 Oct 2019 14:50:38 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id e13sm1407052qkm.110.2019.10.09.14.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 14:50:37 -0700 (PDT)
Subject: Re: thoughts on a Merge Request based development workflow
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Don Zickus <dzickus@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <20191008203249.olm2g2qosflcguuk@redhat.com>
 <20191008213502.GA3591@pure.paranoia.local>
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <6da53e48-20f7-f473-ca4d-d773f1c7330c@redhat.com>
Date:   Wed, 9 Oct 2019 17:50:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191008213502.GA3591@pure.paranoia.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/8/19 5:35 PM, Konstantin Ryabitsev wrote:
> On Tue, Oct 08, 2019 at 04:32:49PM -0400, Don Zickus wrote:
>>> This doesn't mean that forges are entirely out -- but they must remain mere
>>> tools that participate in a globally decentralized, developer-attestable,
>>> self-archiving messaging service. Maybe let's call that "kernel developer
>>> bus" or "kdbus" -- pretty sure that name hasn't been used before.
>>
>> If we flipped it around and used today's git-pull-request emails as trigger
>> for forges to run their services, does cover some of your concerns?
> 
> Not really, because it doesn't preserve any records. A pull request is a
> pointer to some code in a git repository somewhere. Like any pointer, it
> is neither self-contained nor long-lived:
> 
> - the repo can be gone a month later (or that branch deleted)
> - the PR does not preserve any discussions that happened around that
>    code such as bug reports, test success/fail matrices, or peer reviews
> 
> It's also pretty inefficient, because it requires that the pull-request
> submitter hosts a 1.5GB repository on a fast permanently-available
> connection just so they can share a few lines of changes.
> 

I know this is an issue that Outreachy interns across projects have had in
the past with trying to sync large git repos across laggy connections.

The advantage of the pull request though is that it's atomic. It has
the full history for testing. When you test a commit, you always have the
correct base. With a patch, you aren't guaranteed a base for testing.

I know there have been various attempts to try and give a base for
testing but it doesn't seem like anything has caught on enough (or maybe
it has and I've missed it completely)

>> git-pull-request emails can skip the patch-translation layer (like
>> patchwork), run the automated tests, and utilize the current maintainer
>> workflows.
> 
> Where do the test reports go after they are completed? How does the
> maintainer find out that the tests succeeded? How does the next
> developer after them -- say, 3 years later -- find out what tests ran
> against that changeset before it was merged?
> 
> Instead of consolidating the fragmented landscape of Linux development,
> we are further fracturing it and making it lossier. Currently, archival
> efforts like lore.kernel.org at least preserve all discussions/reports
> cc'd to the LKML, but I'm afraid that forges will render large parts of
> the development process completely opaque.
> 

I'd argue a single forge would make things _more_ transparent. Sure if
things get cc'd to LKML they get archived but there's still plenty
of submissions that never get sent to LKML and only to a particular
list. There have been many times I've had to go searching around for
a particular patchwork for a particular list to get a patch because
the submitter forgot/chose not to cc LKML. The weakness of a single
point of failure is also an advantage: There is a single location for
all discussion and bugs and merge requests. Of course this only works
if the forge is considered the source of truth.

Thanks,
Laura

> I suggest that we stick to patch-based workflows and develop better
> tooling and distribution fabric to replace SMTP -- redecentralizing
> things in the process.
> 
>> The email issue is hard to resolve as some folks feel like it should be a
>> primary vehicle while others feel it should be a secondary vehicle.
> 
> If forges are merely participants in the communication fabric, then it
> doesn't matter which one is primary. In fact, email then becomes just
> another bridge, so those who are not interested in switching away from
> their current email-based workflow can continue using email.
> 
> -K
> 

