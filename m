Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FA1C47404
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43F9720B7C
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfJIWJk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 18:09:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42714 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730490AbfJIWJj (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 9 Oct 2019 18:09:39 -0400
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1FDDF8666C
        for <workflows@vger.kernel.org>; Wed,  9 Oct 2019 22:09:39 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id g62so3393701qkb.20
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 15:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ik5H90J4y4sHOz5mlr+SJxXWakh7A0rMr4m3UMZSqvg=;
        b=tkYbBH/RThBiUuI88Hr/Ky7P6vBjRCZs99bm1A1d7JJpB2gdJIZnUEWkqOt/jeA+wG
         hu0xw/+TXQVlnowdF7aGG+3T+t+04006CcpyVoLPcMTbsDU/2qJ+/uTiaYvvtfAX49H2
         /zJs4y0edpE/P2OAIGGLKTsksVyHq12ScoOgfLFHz3LJNPSd3El793cfErxkJEoJ4K3a
         0NfhzWrzzrkJ+/kIXd/7CYZSEwMngSdIv5gDw934Tyz0I1e5mh1zE49rfBAZpqkFaKjT
         fglBHIm09EP5m7xPcqq3aRBZi07x/OGC62+uSps3EbyRDpXUj80En7HJ72oBDFrOdNbF
         EOwA==
X-Gm-Message-State: APjAAAWp+P90GLY361ssK3EHJ8SVpE6XG8Rwc6kI20xL8FDPFo+lTcTo
        bNwcnAhP/e3sNZfEBW1bVcAXO9fS/eEZ1bEzKGP2O8O0OwWTpsWEzjvTFkjo/pH4Jv6bJst10tF
        0llhY0IfV2sSrKutOD4rJ
X-Received: by 2002:a37:9007:: with SMTP id s7mr5981829qkd.384.1570658977807;
        Wed, 09 Oct 2019 15:09:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwD0Hvy0DFs61Jb2XzgethgdsS5ASJd6Rny4FZRpELM0r8qtXmH9mRjeC3thFyFOOdvCMd3sA==
X-Received: by 2002:a37:9007:: with SMTP id s7mr5981781qkd.384.1570658977337;
        Wed, 09 Oct 2019 15:09:37 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id 200sm1558116qkf.65.2019.10.09.15.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 15:09:36 -0700 (PDT)
Subject: Re: thoughts on a Merge Request based development workflow
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
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
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <68faa5ef-6092-ea5f-191c-4b7713cb6ab2@redhat.com>
Date:   Wed, 9 Oct 2019 18:09:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/9/19 5:54 PM, Konstantin Ryabitsev wrote:
> On Wed, Oct 09, 2019 at 05:35:39PM -0400, Laura Abbott wrote:
>>> This doesn't mean that forges are entirely out -- but they must remain mere tools that participate in a globally decentralized, developer-attestable, self-archiving messaging service. Maybe let's call that "kernel developer bus" or "kdbus" -- pretty sure that name hasn't been used before.
>>>
>>
>> The big issue I see with anything decentralized is that as things
>> grow people don't actually want to host their own infrastructure.
>> Think about the decline in the number of people who host their own
>> e-mail server. Anything decentralized would still presumably require
>> a server somewhere, so you're going to either raising the bar to entry
>> by requiring people to set up their own server or end up with people
>> still relying on a service somewhere. This feels like it ends up with
>> the situation we have today where most things are locally optimized
>> but on average the situation is still lousy.
>>
>> You've articulated you've articulated the reasons against centralization
>> very well from an admin point of view (which I won't dispute) but at
>> least from a user point of view a centralized forge infrastructure is
>> great because I don't have to worry about it. My university/company
>> doesn't have to set anything up for me to contribute. I get we are
>> probably going to end up optimizing more for the maintainer here but
>> it's worth thinking about how we could get forge-like benefits where
>> most users don't have to run infrastructure.
> 
> We're actually not in opposition to each-other -- I expect kernel.org
> (via Linux Foundation) would provide convenient bridge tools to cover the precise concern you mention. Think kind of like patchwork.kernel.org, but instead of exclusively using some local database that only admins at kernel.org have access to, it would provide a set of feeds allowing anyone else to set up a fully functioning replica -- or participate in the process using their own compatible tools.
> 
> So, in other words, the forge is still there and is still providing a valuable service, but it is not the single point of truth that can vanish and take invaluable data with it. That's my vision, and I think we have all we need to achieve it short of resolve, buy-in, and proper tooling.
> 

I'll admit I'm skeptical about the "participate with their own tools"
bit, simply because you end up with too many sides arguing about
standards and either n buggy implementations or effectively a single
implementation anyway.

I'd also love to be proven wrong and would be interested to see a
proof of concept.

Thanks,
Laura
