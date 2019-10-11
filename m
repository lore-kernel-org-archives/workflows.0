Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE555ECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 20:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D09E214E0
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570824152;
	bh=UoGFRwVKzOvxIjGRugFePTWZAa0TWXUMXC2iyEp2wR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jCV6MvV4H15X0/rgNGYDHQyZiqBQygZnbL74HlOJDxZs2UcS1FPO5VaN2He6Jt4Sm
	 u7X49TAwrHvH+8gc7jSgGldyZBJfl6yj6njBJGMqMxTjHfomCKksLk/1QkMuw7AZfs
	 719KwcFEsKA12xPsoDuif4wtOI+//7ouyOnU6fqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfJKUCc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 16:02:32 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:33755 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbfJKUCc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 16:02:32 -0400
Received: by mail-qt1-f173.google.com with SMTP id r5so15663519qtd.0
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VI0vvqGGg8Z9Zi6cM62wlFbkwy+IvB23QhqNLaccEjc=;
        b=agzV9yELWLRDUId4oB7+WqSBQfvvYO/OFsjskRSdOgo/rDCNhGiE/XFLBQeLushbfO
         Q7I4VNm4JU6MQMv7IN85vGS9mSa0Tmt/a23G+ZByoOoxOR90wLz/7RCFfTsQYiqLyJI4
         uWS3wnS+yYHahH9HisfFKcswHA6zhbaeKbfBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=VI0vvqGGg8Z9Zi6cM62wlFbkwy+IvB23QhqNLaccEjc=;
        b=Lq04ic90IVbGm6oUsifpOFGpdff6/Gk1ss7LsqChBoab2wP5IoyyQxxb0VquRVRd7Y
         KO4OTXSTqMzUjumy8dygcQTxYV3WHQ4lhIwuMytqlgVR7H6Ke5mew37kYeuC183AqeJc
         yBJUraEJH1vog5eG/nHbG3P3bmcSfZCkkfOcEmOWVhexERS++W+1dM8Y7DtqlspAJnLz
         u603o9vkxHbfe0UegAF5Q1Yfjo92kS/6a+ysUk/IhJm3Yonu5BaRatQANWTxQct15rIR
         ys3JHYme3NKJjyECXX158XexMcS+CImcUODXIlyfxKwegOhAn2jJtdieH3nvDU817ztO
         zrXw==
X-Gm-Message-State: APjAAAWcIj6zzgKtWUqCyAufTJeKV+EXmWG04iD8v8eFQKCxUyQQN3lN
        I5nMMoBxuja39e9ApwvdetabYeFaDj8=
X-Google-Smtp-Source: APXvYqwy30+vR+gLomNT3SLq3FE7WZE4tCWs/GzRpGhh+P2igETxrYVGx5IfCp0TU8Hd/Bj1oE04Yg==
X-Received: by 2002:a05:6214:1264:: with SMTP id r4mr18249343qvv.64.1570824150869;
        Fri, 11 Oct 2019 13:02:30 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id d55sm6738095qta.41.2019.10.11.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 13:02:30 -0700 (PDT)
Date:   Fri, 11 Oct 2019 16:02:28 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191011085702.GB1075470@kroah.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 10:57:02AM +0200, Greg KH wrote:
>So other than that minor thing, sounds interesting.  It's hard to
>determine just how difficult the whole "set up git and send a patch out"
>process is for people these days given the _huge_ numbers of new
>contributions we keep getting, and the numerous good tutorials we have
>created that spell out exactly how to do this.
>
>So you might be "solving" a problem that we don't really have.  It's
>hard to tell :(

It is interesting that there are split views on this. The main reason 
why I was thinking about it was because the topic came up a few times 
already. For example, in a conversation last year on ksummit-discuss:

https://lore.kernel.org/ksummit-discuss/ECADFF3FD767C149AD96A924E7EA6EAF7C1EAA24@USCULXMSG01.am.sony.com/

Tim Bird mentioned that Sony developers couldn't send/receive patches 
because their corporate mail server rewrote all links to go through some 
kind of security appliance verification. If you read that thread, what 
we are discussing now is what I suggested we did then -- a web tool that 
could take corporate SMTP servers out of the equation.

(This is the same reason I generally disagree with Eric Wong about 
preserving SMTP as the primary transmission protocol -- I've heard lots 
of complaints both from kernel developers and especially from people 
trying to contribute to CAF about corporate policies actually making it 
impossible to submit patches -- and no, using a different mail server is 
not a possibility for them because it can be a firing offense under 
their IT AUP rules.)

>> I know this is a pretty big RFE, and I would like to hear your thoughts
>> about this. If there is general agreement that this is doable/good idea, I
>> may be able to come up with funding for this development as part of the
>> overall tooling improvement proposal.
>
>The workflow seems sane, and matches what most people do today, with the
>exception that it "solves" the git send-email issue, right?  Is that our
>biggest barrier?

Well, I can't really speak from my extensive experience as a kernel 
developer, but I *have* submitted patches to Documentation/* before.  
This happens infrequently enough that I basically have to relearn the 
whole process from scratch, and it *is* a lot of steps. I can't fault 
people who are only familiar with the GitHub way of doing things when
they complain that this process is a challenge for them.

Not everyone submitting changes to the kernel are going to be highly 
skilled and comfortable with the terminal and command-line tools. They 
may be submitting a documentation fix, or it can be a driver developer 
who never leaves Visual Studio submitting a small bugfix so their driver 
works better in Linux.

>I would recommend interviewing some of the recent kernel mentor project
>and outreachy applicants first, to try to determine exactly what their
>problems, if any, were with our development process.  If they say that
>this type of tool/workflow would have saved them hours of time and
>energy, then that's a great indication that we should try to do this.

I don't disagree and Shuah's comments are very valuable here. However, I 
would argue that these folks don't necessarily represent the target 
audience for this tool. They may be newbies, but they join these 
initiatives with the goal of spending significant time with the kernel 
and its code, so they don't mind the effort of learning the proper way 
of submitting patches.

I'm thinking of someone who needs to submit an occasional contribution 
once every six months and to whom this document is both long and 
daunting: 
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html.

-K



