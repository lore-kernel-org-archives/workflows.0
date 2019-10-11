Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36B7ECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B5942190F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570822745;
	bh=2b56i1CRmHlvSyS2ceECtSWs4IHyWktMriVwuNgnaiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I+KVW1g6Ebh+KtECQubmMWPeEFsCUVvy3uX5J5P0CstHJ9SaCxIjH0aI/UckLjMfA
	 nIEUvHwzMTA88kITUZQeusKlQDZzTGcPxtlanhokyfQOiX3WK7OGI6BqNxW44gykWR
	 2TxaUsF6ZFMeZDi1HOWMg1WNk4DHLnHhCzaAG9+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfJKTjF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 15:39:05 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:43417 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbfJKTjE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 15:39:04 -0400
Received: by mail-qt1-f177.google.com with SMTP id t20so10155878qtr.10
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7KznzXKn1y27zO6E1D0xrZYxgqv9HCQeD/PET8n69cs=;
        b=CuMcg6hxetZrfE68ifB90Dv7mIQQq8D8oDn6a9oMoGFcQDP4pdqy91wQ2XCaQkzaX3
         3Tv91jrR7zwUOtXUd1ymMmr9xtbUIT+/p+OO1aE382giH+/RXat0DTZRvcgsOFmpYvXa
         5t8UvPXUm1s2ddRedKbK23wZmCneG5Q5a8lI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7KznzXKn1y27zO6E1D0xrZYxgqv9HCQeD/PET8n69cs=;
        b=mvufvwHfGTAunBZtte+0AbNTFg0b+H96cYZz40N7v8VFxhBYJmYACf9UE3BPZgBfIk
         DNF/bpZhjEpe9lGHmw3uEyafxyubWy5+Apw7etSGl+d2Q/MoEJLl8J5OfTSF9Mu9lRy2
         XljBSNk5JsvBE0XCWrAoeVk8c+G7dnuRLFj1Xz5x1Zjv3RhdhFfNOsiVRDFpMifJnT3C
         rApARsyJq3Fi+1FUrAuhTMwinZ2ymDT4TqpOgGCcrEwq36dhhkcrA/y2xu+zX3+fVjBv
         TP7/FUgARdyM8pzjsSlCNBsDkkJ76PFJxXN5YhtGYZLaX+fZlEz0rfbKpYgjZIA4Ezqj
         zmdQ==
X-Gm-Message-State: APjAAAUwLXU+SJss0KwMwLfUdNWRhYX8E2cH/NBHIvWOpsn3vnJe2NJP
        0DN+mDu9DoN8fplOXwBKaDjZeg==
X-Google-Smtp-Source: APXvYqxbjdBijjJBZeiYfnKyJ1TwBSV09ebuExKa84JBbfUA3MGKhcTkkYGmm2a6TsuxskV+8jUHFg==
X-Received: by 2002:ac8:1242:: with SMTP id g2mr18520666qtj.141.1570822743220;
        Fri, 11 Oct 2019 12:39:03 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id d69sm4748834qkc.87.2019.10.11.12.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 12:39:02 -0700 (PDT)
Date:   Fri, 11 Oct 2019 15:39:00 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191011193900.cx6ov6abwelzz2ey@chatter.i7.local>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
 <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 07:15:12PM +0200, Dmitry Vyukov wrote:
>> The main upside of this approach is that it's evolutionary and not
>> revolutionary and we can start implementing it right away, using it to
>> augment and improve mailing lists instead of replacing them outright.
>
>
>Interesting. This is similar to SSB on _some_ level, right? Because
>it's just a different type of transport. I personally don't have any
>horses in the transport race (as long as it is easy to setup and
>provides a good foundation for transferring structured data).

It's similar only in the sense that it's a chain of records that can be 
optionally cryptographically signed. Some of the problems that SSB (and 
especially v2) tries to solve are not anything git concerns itself 
about, such as discovery, feed cross-reference, verifiable partial 
clones, etc.

>What attracted my attention is this part:
>
>refs/feeds/gregkh/0/master
>refs/feeds/davem/0/master
>refs/feeds/davem/1/master
>
>Will this provide a total ordering over all messages by all
>participants? That may be a significant advantage over SSB then (see
>point 14 in [1]). But the "that can be pulled individually" part
>breaks this (complete read-only mirrors for fault-tolerance are fine,
>though).

No, these refs are entirely independent of each-other. In a sense, it's 
the equivalent of cloning individual public-inbox repos together and 
then tar'ing them up. For ordering, we still have to go with commit 
timestamps and we'll still have conflicting resolutions, just like you 
mention (though this isn't any different than with email).

>This may also need some form of DoS protection (esp as we move further
>from email).

Well, amusingly, there are ways of distributing git via decentralized 
protocols (SSB, DAT, IPFS). They are all fairly immature, though, and 
some of them are truly terrible ideas.

For the moment, our best protection against DoS attacks on git repos is 
having many frontends, some powerful allies (e.g. see 
kernel.googlesource.com), and DoS-avoidance by obscurity ("I can't push 
to kernel.org right now, but you can pull my repo from my personal 
server over here").

>I also tend to conclude that some actions should not be done offline
>and then "synced" a week later. Ted provided an example of starting
>tests in another thread. Or, say if you close a bug and then push than
>update a month later without any regard to the current bug state, that
>may not be the right thing.

The same is true with email, though -- people who queue up email in 
their outbox and lose connectivity before they can send it out is 
something that happens often. True, we aren't solving this, but it's not 
a net-new problem and will always be a hard problem to solve for laggy 
decentralized environments.

>Working with read-only data offline is
>perfectly fine. Doing _some_ updates locally and then pushing a week
>later is fine (e.g. queue a new patch for review). But not necessary
>all updates should be doable in offline mode. And this seems to be
>inherent conflict with any scheme where one can "queue" any updates
>locally, and then "sync" them anytime later without any regard to the
>current state of things and just tell the system and all other
>participants "deal with it".

Well, in all honesty, "queueing things up for a week" is going to be an 
increasingly rare problem for anyone who works on the Linux kernel. I 
don't know about others, but I can recall every time I've actually been 
offline in the past year and in each case it involved a cross-atlantic 
flight with a totally broken wi-fi or a trip into a rare spot on the map 
without cell towers. Even long power outages simply mean I have to 
tether my laptop via my phone. Thanks to wireguard, I don't even lose 
ssh sessions when that happens. :)

Replicating a feed out is a very quick task that can be made quicker 
with tricks like ssh controlmaster connections that keep sessions going.

>This is interesting too:
>
>refs/heads/master -- RFC-2822 (email) feed for human consumption
>refs/heads/json -- json feed for machine-readable structured data
>
>Playing devil's advocate, what about MIME? :)
>It does not need to be completely arbitrary MIME, but say only 2
>alternative section, first has to be plain/text, second (optional) has
>to be kthul/json. 

The main reason why I wanted two different refs is so entities like bots 
could only pull the json ref and ignore the one aimed at humans. So, 
while this makes the repository larger by having some data duplication, 
this should make pulling and parsing less problematic by bots, and I 
expect bots to be the ones generating most frequent hits and traffic.

-K
