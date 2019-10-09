Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A723AECE58C
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8949E206BB
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbfJIVfn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 17:35:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49450 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730490AbfJIVfn (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 9 Oct 2019 17:35:43 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4ECA1B2721
        for <workflows@vger.kernel.org>; Wed,  9 Oct 2019 21:35:42 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id n59so3538821qtd.8
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 14:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1U74p4b5WyOXFt9SRfRuALY4r0esN/CltEQfWXF5Hd0=;
        b=dOXE38SK9reCdDy65aF/p7F9GcnnOvnwSltiBnbXtPCXAxliwsmfB3G7ZhuNpHIdfL
         YMmplbFfbVxSnT69p9WcjD95mAEC95ztw9iSNVoZoj4sdOJLrBEz0LeOHrtcMUiUV6yr
         n5mCVrUneEoD5iymYA92BKIUawG8SiG4iopJszadBcstS+jhuXWq3bci4yFcVHnOAB3J
         zs4EPVQzY3+003l2luSd2Dc/JEwHIzn30EAFlM8HgI8jTcy3/8mLciBsMs22MEme9FG9
         Wkdh+T+3WamkIg3xox+m8o4CTVsjMUDlsG5XkTkxtuxPzbA6yoiNhJZ+XOo7XvyZklbm
         FVMw==
X-Gm-Message-State: APjAAAVb5+UR94lieUn3H0P883VTb8I+J1fdeDienzkoVz+6BJkWvk4H
        CN+0Hjts+J6pwoPIgYpNNDMPzoK9Qab9NyYoncprkGrXFndYbAyf8+uFw6oI3N7cu1tgWYgFlej
        h1A+Yc80IuK73zSNmkVet
X-Received: by 2002:ac8:2670:: with SMTP id v45mr2402627qtv.233.1570656941111;
        Wed, 09 Oct 2019 14:35:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzjrtsL/Gk6Y9m5xzVb/EA420EVhfZ3YWvzBmT7/4AlD+bM0esTtnlu0X5HQb0YZr5JZUvcQ==
X-Received: by 2002:ac8:2670:: with SMTP id v45mr2402587qtv.233.1570656940659;
        Wed, 09 Oct 2019 14:35:40 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id a4sm1631549qkf.91.2019.10.09.14.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 14:35:39 -0700 (PDT)
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
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
Date:   Wed, 9 Oct 2019 17:35:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/8/19 3:05 PM, Konstantin Ryabitsev wrote:
> On Tue, Oct 08, 2019 at 01:39:02PM -0400, Don Zickus wrote:
>> Regardless, I think what you wrote re-enforces the idea that emailing a
>> patch series (and their vX followups) is messy for the maintainer and a
>> more evolved idea is to let a forge take git-push as input.
> 
> I'm pretty opposed to the idea of forges, because this approach makes it very easy to knock out infrastructure critical to the project's ability to quickly roll out fixes. Imagine a situation where there's a zero-day remote root kernel exploit -- the attackers would be interested in ensuring that it remains unpatched for as long as possible, so we can imagine that they will target any central infrastructure where a fix can be developed and posted.
> 
> Currently, such an attack would be ineffective because even if kernel.org is knocked out entirely, collaboration will still happen directly over email between maintainers and Linus, and a fix can be posted on any number of worldwide resources -- as long as it carries Linus's signature, it will be trusted. If we switch to require a central forge, then knocking out that resource will require that maintainers and developers scramble to find some kind of backup channel (like falling back to email). And if we're still falling back to email, then we're not really solving the larger underlying problem of "what should we use instead of email."
> 

I'd argue that e-mail as a backup solution is perfectly fine. The issue
with e-mail is that it's not scaling. If something did happen and we
needed to temporarily move back to e-mail, chances are it would be
at a smaller scale.

> We also shouldn't forget trigger-happy governments that like to ban troves of IP addresses in their chase after "the safe internet." Github has already been banned a couple of times in China and Russia, and chances are that this will continue.
> 

We've had this problem with e-mail spam filtering too. Any sort
of system seems likely to have this problem of needing to block
unwanted content but purposely or not blocking non-malicious
content.

> This doesn't mean that forges are entirely out -- but they must remain mere tools that participate in a globally decentralized, developer-attestable, self-archiving messaging service. Maybe let's call that "kernel developer bus" or "kdbus" -- pretty sure that name hasn't been used before.
> 

The big issue I see with anything decentralized is that as things
grow people don't actually want to host their own infrastructure.
Think about the decline in the number of people who host their own
e-mail server. Anything decentralized would still presumably require
a server somewhere, so you're going to either raising the bar to entry
by requiring people to set up their own server or end up with people
still relying on a service somewhere. This feels like it ends up with
the situation we have today where most things are locally optimized
but on average the situation is still lousy.

You've articulated you've articulated the reasons against centralization
very well from an admin point of view (which I won't dispute) but at
least from a user point of view a centralized forge infrastructure is
great because I don't have to worry about it. My university/company
doesn't have to set anything up for me to contribute. I get we are
probably going to end up optimizing more for the maintainer here but
it's worth thinking about how we could get forge-like benefits where
most users don't have to run infrastructure.

Thanks,
Laura
