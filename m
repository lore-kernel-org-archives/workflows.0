Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD4CECE58C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0688420873
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571168472;
	bh=WScuXPtfFTf9unLfdgaNkYgki33qWX7MIFGikmjV4pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=i80fbAMnWMvdRN4a6G+bzpzp8lABPHxdtv/t/M+2qzMkMeqrEtHkF9NoRWfNtKk+c
	 Ac+5Ki5vK2wIT7k6QbPO4yiCdgY8J2PLB93x6ISaNcsuGErZkU0+uz9TBHofNrkWdj
	 6bN5s0HMN7155Mlh15opP/l+4ILHh2w4w3sg7Vc0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbfJOTlI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:41:08 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36165 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfJOTlH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 15:41:07 -0400
Received: by mail-qt1-f193.google.com with SMTP id o12so32392375qtf.3
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y1v8LT3uZi70xsJGvkUN2OlG6x7miRUrC2lAt8egJgM=;
        b=DSRsfy8c5pgGkN12uUyp2+JOAL+Hiw4nfIcxS2iVryyawX3Pc4dvrgWqB0tsxCGD6p
         PF0teoLJuH/ar3vnpdJfdnxs/oM+J/o1fw7UUUJLhKdLnq+6mogOIkZ/rweL/VnnCFcN
         nyYje9y7Y1b7K2e6UsnkkJidhQpQ21b9bhBqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y1v8LT3uZi70xsJGvkUN2OlG6x7miRUrC2lAt8egJgM=;
        b=C5NCkQoE26AxSvXf+78MU2HhyvYwVgSZFKVFNZUhFjy1Jjdee2hmPcepfDwT6JDEpL
         KqqfSZaqdouhGGYF+1zu6fPbw2rITzUmSXMb/LNP1hdeDPqI/yRm4Zm+PQdcDtYXgeHe
         QEkzyMTU7m+FDLMcFLf5zQQrvWOLTybilzbMae9M01Hua6ySc4+ylp9MiN1QUyBfqpys
         9stWhhB+zbZUV7pktFD3oOmAAL2cLHxFqsKiHYOO7DyouWwnR7Vp49SIzPABdQX+5Fg2
         HNODw9Ppoez9FtEh7hkUnwTHwUy2Sinzy5jWjCGXOsGyJmE9+j3/pMLUBNi6KRJ8J/ys
         szsw==
X-Gm-Message-State: APjAAAU8qDkUogTYfNEajior88yEF64FqXG1S3AyB3fD912r7Syp4uMG
        mVsy9eZSkQLKPJQPTORCUL9Imw==
X-Google-Smtp-Source: APXvYqxp2Utr/EILO+4t62wqKGGNT6B1ZaQR0H3tAlVrpOrlO3pnCSMiSt9a/7FD1mrwLtA4X6Yekg==
X-Received: by 2002:ac8:16eb:: with SMTP id y40mr40753330qtk.67.1571168466323;
        Tue, 15 Oct 2019 12:41:06 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id v4sm9382573qkj.28.2019.10.15.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 12:41:05 -0700 (PDT)
Date:   Tue, 15 Oct 2019 15:41:03 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015194103.GA23517@chatter.i7.local>
References: <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015183752.GB5473@chatter.i7.local>
 <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 09:15:27PM +0200, Han-Wen Nienhuys wrote:
>> As I see it, there are the following things that would make Gerrit a
>> difficult proposition:
>>
>> 1. A gerrit instance would introduce a single source of failure, which
>>    is something many see as undesirable. If there's a DoS attack, Google
>>    can restrict access to their Gerrit server to limit the requests to
>>    only come from their corporate IP ranges, but kernel.org cannot do
>>    the same, so anyone relying on gerrit.kernel.org cannot do any work
>>    while it is unavailable.
>
>I don't understand your scenario. Are you concerned that Google would
>protect DoS attacks by limiting traffic to the corp network?
>
>Or are you concerned that kernel.org has no DoS protection?

Kernel.org operates on a pretty small budget, largely using 
infrastructure donated by kind entities. If it suddenly becomes a 
liability, I'm sure those entities will kick us out. A large, sustained 
DoS attack would be one such liability, and due to the nature of git, we 
can't really hide behind cloudfront or any other DoS-mitigation
platforms.

If a DoS attack is waged against Google's gerrit server, they can drop 
the packets at the perimeter and still keep the service available to 
Google engineers coming from internally routed traffic. This is not an 
option for kernel.org, so a DoS attack against a central resource would 
be super effective in stopping all work on Linux.

>
>How does DoS protection for kernel.org work today? If someone DoSes
>git.kernel.org with its 1000s of git trees, how do people get work
>done?

The git trees on kernel.org are just convenient copies. Most kernel 
development is done via mailing patches, which is a distributed and 
DoS-resistant process. The only time git.kernel.org enters into the 
picture is when people need to send a pull request to Linus (via email).  
If kernel.org is out for an extended period of time, they would just 
push their repo elsewhere and send a pull request referencing the new 
URL. Since Linus checks PGP signatures when pulling remotes, the 
repository can be hosted anywhere at all without needing to trust the 
infrastructure.

With gerrit, if gerrit.kernel.org is down, then everything grinds to a 
halt. If it's down for an extended period of time, then in theory people 
can push their git trees elsewhere, but then they would have to 
force-push back to gerrit once it's back up.

>> 2. There is limited support for attestation with Gerrit. A change
>>    request can contain a digital signature, but any comments surrounding
>>    it do not. It would be easy for the administrator of the gerrit
>>    instance to forge a +1 or +2 on a CR making it look like it came from
>>    the maintainer or the CI service (in other words, we are back to
>>    explicitly trusting the infrastructure and IT admins).
>
>Does anyone use attestation/PGP signing for their code reviews that
>are conducted over Email? How many people use PGP signing on their
>commits?
>
>How does email figure into this story? Email has no authentication at
>all, so if this is a requirement, you should probably stop using email
>for reviews.

Well, it's one of the problems we are trying to solve! Linus verifies 
PGP signatures on all pull requests he receives that aren't coming from 
git.kernel.org (and I always complain to him that he shouldn't make an 
exception in our case either).

And we *are* trying to stop using email for reviews -- preferably 
without introducing single points of trust and single points of failure.  

>> 3. There is no email bridge, only notifications. Switching to gerrit
>>    would require a flag-day when everyone must start using it (or stop
>>    participating in kernel development).
>
>Gerrit sends out email for comments. If you reply to that email,
>Gerrit ingests the comment and puts it in the review.

Ah, okay, I guess we've never configured it that way. But you can't 
+1/+2/Merge anything using this mechanism, right? Otherwise that would 
be a backchannel around authentication. :)

-K
