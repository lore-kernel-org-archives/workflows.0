Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE3ACA9EBC
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 16:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 271A220663
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572021286;
	bh=73ikf2kkUZQjp8PX8Q8Q+iLYlycTaDWO8+AGHBowkho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zS2p6vy7gNX0x/8w+tzZmEektG5lVUZoEoBO9jlHaCKI8rmt1wU93K6tbCxsxudwV
	 DewGdroe+Qfiss7lwa0Bsf9uvxxf4hqBBdAxHsPIOqX2Oh6ejatk7aMVWJfLPIz0W6
	 WlxsLpEgckxP+no4YrB9Wjaa1evCtkfBdKTnsYJ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391211AbfJYQep (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 12:34:45 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38913 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390353AbfJYQep (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 12:34:45 -0400
Received: by mail-qt1-f194.google.com with SMTP id t8so4146693qtc.6
        for <workflows@vger.kernel.org>; Fri, 25 Oct 2019 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZzuMoUW9nL3txMEdTJ9XgUATvp+vohOFem7VSLZndxM=;
        b=V6loMynR51IXK5Uh3Uz8hul19FqYBOTdlPifpgqSVEAM1F4ObmQBhZau93eB5N2RnN
         nhplMUwzSOmoSFF+fCBbJSnX0wN0ItnKnoUaEeqFE9mwZ1UqxOkX2KuuwZoS4qz3NtlE
         dE5jxh5cmxNZNz7a97C85o1qoa7sCG2iBo1mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=ZzuMoUW9nL3txMEdTJ9XgUATvp+vohOFem7VSLZndxM=;
        b=sMU4O13LJjGPjTpeOrwQeb8CoN6tIveKSFhlfB2PfkqdIo0rE5JiC1oC/vnhLO1IUv
         3iWRApMWC6g7BotHblEPS+dRzzuH/ShRE535HeEfGq9cAFftwfJR8QUCuI9N3uMSVs2x
         mn3mDaek8AeszkxK7zs7aUeocC+oSLTrOBjkZ58JgzF1ptyXwB0cJxHt5G/KFVhr5/1g
         kOFGp7YSQy/QJ5tw+EZa/nkqlut0WFeG8d0gpyem+F3DnyLqiqWHQXO/Ad9Pv6hMzLXY
         m5Xb9pjXY6ZVzgRxb5hp0DZheQSIMeXwYLXrcNOQyzTHjzh1YnhWYus2EFjSd7mJYDb7
         TBag==
X-Gm-Message-State: APjAAAVkWO07ZUSk1ZZ0ffnj4tXq4aopK3QLUSUCQI61rEEa+f02O3JB
        gV15CYU7G4Ct2+ytWoQ4qaY7V4kCCmA=
X-Google-Smtp-Source: APXvYqzjx4j/H27n5mz467dFdm+fjNZTliMh4eTlmkmw+XDgygL3bwC15sAnxfIhgOfBLnHeWtCDrg==
X-Received: by 2002:a0c:95d2:: with SMTP id t18mr4258748qvt.50.1572021283754;
        Fri, 25 Oct 2019 09:34:43 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id m63sm1327855qkc.72.2019.10.25.09.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 09:34:43 -0700 (PDT)
Date:   Fri, 25 Oct 2019 12:34:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     bpf <bpf@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>, workflows@vger.kernel.org
Subject: Re: patch review delays
Message-ID: <20191025163441.idjzlnwahoacnhbp@chatter.i7.local>
Mail-Followup-To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        bpf <bpf@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>, workflows@vger.kernel.org
References: <CAADnVQK2a=scSwGF0TwJ_P0jW41iqnv6aV3FZVmoonRUEaj0kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAADnVQK2a=scSwGF0TwJ_P0jW41iqnv6aV3FZVmoonRUEaj0kQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 25, 2019 at 07:50:22AM -0700, Alexei Starovoitov wrote:
>The last few days I've experienced long email delivery when I was not
>directly cc-ed on patches.
>Even right now I see some patches in patchworks, but not in my inbox.
>Few folks reported similar issues.
>In order for everyone to review the submissions appropriately
>I'll be applying only the most obvious patches and
>will let others sit in the patchworks a bit longer than usual.
>Sorry about that.
>Ironic that I'm using email to talk about email delays.
>
>My understanding that these delays are not vger's fault.

If you're receiving them at your gmail address, then it's possible 
Google is throttling how much mail it allows from vger.kernel.org. At 
least, that's the usual culprit in my experience (I don't have access to 
vger, so I can't check this assumption).

>Some remediations may be used sporadically, but
>we need to accelerate our search of long term solutions.
>I think Daniel's l2md:
>https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git/
>is a great solution.
>It's on my todo list to give it a try,
>but I'm not sure how practical for every patch reviewer on this list
>to switch to that model.

Remember that all lore.kernel.org lists are also available via NNTP, 
e.g.:
nntp://nntp.lore.kernel.org/org.kernel.vger.bpf

I know some people can't use it easily due to NNTP ports being blocked 
on their corporate networks, but it's another option to receive list 
mail without waiting for SMTP to unclog itself.

>Thoughts?

One service I hope to start providing soon is individual public-inbox 
feeds for developers -- both for receiving and for sending. It would 
work something like this:

- email sent to username@kernel.org is (optionally) automatically added 
  to that developer's individual public-inbox repository, in addition to 
  being forwarded
- that repository is made available via gitolite.kernel.org (with read 
  permissions restricted to just that developer)
- the developer can pull this repository with l2md alongside any 
  list-specific feeds
- the hope is that the future tool we develop would allow integrating 
  these multiple feeds into unified maintainer workflow, as well as 
  provide the developer's individual "outbox.git" repository

There are some things that still need to be figured out, such as obvious 
privacy considerations (public-inbox repositories can be edited to 
remove messages, but this requires proper hooks on the server-side after 
receiving a push in order to reindex things). It's one of the topics I 
hope to discuss next week.

-K
