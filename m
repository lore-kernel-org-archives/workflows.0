Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC61ECA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 11:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AF4221D71
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 11:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KIWXTMpA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfJYLwb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 07:52:31 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42008 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfJYLwb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 07:52:31 -0400
Received: by mail-qt1-f194.google.com with SMTP id w14so2742293qto.9
        for <workflows@vger.kernel.org>; Fri, 25 Oct 2019 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZPYrsdCeDdSvVJvLlE5GGBPDXqi76t9970cG54t1oU=;
        b=KIWXTMpAH5sGf44a7npUKsm4b3LCbIIMPtqxjnkVfa4hH2XqZM2MscDnvj5du3VbLM
         SQsJl6e1lJf88XvFRS6o+p1fbnJ4cEgDy6xrmNKd/7F7r37cjl146ZEcaw8pS1nobBWZ
         EbHmYZ4/NdZaQRWmvBaI5er9Cj8Qyqvl5hJm4cICUo7axc+QPBCOmDKDflMXZHWvC7ZH
         gimyBErYno2tIWGQgllV5wzKsoJud8817SUJUg1+4db2sg3Q4vWjYgkVp6A1vYa+cg8g
         SM4Mp/EZv8QixQcJzuLoo4ieP0QdjV1P68vKDpo8QaqySMGLczpCp52VFh3e79jeJ5WP
         m+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZPYrsdCeDdSvVJvLlE5GGBPDXqi76t9970cG54t1oU=;
        b=nR2d8Ta46gJZV0dtMG0r20lfOt5XYw0QmUXE83U4LKAZw2HcUjIP2OGG9mdgbL7IEw
         xGhDNpSU3XkPYvYss8U7G75kv4EYnao8WywgGJDfJVFA7s1HYtCgYOT+TpuAdh4Pk/2p
         H1UKpKj3Q5iJPelibXgamjUaau5cUP9/ojA80bA3y48SFv8iS+0VNphLTo7PznW4LV54
         4Oy0v3wUwXf+3BRUa+nvLbzf8bsHkVxhZsMxbyYM7EQGvwD5N8iQE6wKI2r9fIdu5tz5
         MixM2gUfuKsswixiJJuDL8NOeCuogDnqKZUZv2/gt/2F5TvaccUSa+Dw+RK9lDOeYwkX
         v5Og==
X-Gm-Message-State: APjAAAXvsmUr3pRKnVtScsZKBZz+lGEg5yc3DlJdjryAuEc+4Wp7GT3p
        35mv9HJ+1L9qflbr/YXJSWiGsmjOY/i+svW1qCjEQI4G
X-Google-Smtp-Source: APXvYqyCSU5TJ5oHPsbuZQXcJzYk5fF9g7aev9YVziuv+TFynECEIB++kM+MyTIVOU7ST1IeGOY25wKvhTeLHr6rOZ8=
X-Received: by 2002:a05:620a:2158:: with SMTP id m24mr2437291qkm.250.1572002443616;
 Fri, 25 Oct 2019 04:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local> <20191025111610.GB4740@pendragon.ideasonboard.com>
In-Reply-To: <20191025111610.GB4740@pendragon.ideasonboard.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 25 Oct 2019 13:20:32 +0200
Message-ID: <CACT4Y+ZzszuHGOAnG7a9vzOOmD+WJVGe7Vm+Oot=Cwjv=izjhA@mail.gmail.com>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 25, 2019 at 1:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Konstantin,
>
> On Thu, Oct 24, 2019 at 04:58:03PM -0400, Konstantin Ryabitsev wrote:
> > Hi, everyone:
> >
> > So, if I read everything correctly, the meeting shall take place at OSS EU
> > Lyon, on Tuesday, from 14:00 to 15:00. The following people have
> > expressed interest in attending:
> >
> > - Steven Rostedt
> > - Greg Kroah-Hartman
> > - Dmitry Vyukov
> > - Konstantin Ryabitsev
> > - Christian Brauner
> > - Laurent Pinchart
> > - Jon Corbet
> > - Daniel Vetter
> > - Nicolas Belouin
> > - Shuah Khan
> >
> > (If your name is not on this list but you're planning to attend, please
> > follow up.)
> >
> > I have confirmed that we can use the Developer Lounge, which will
> > contain either a whiteboard or a flip chart. Alternatively, if you think
> > we should get a dedicated meeting room, we can book one on-site. It's on
> > a first-come, first-served basis and it doesn't look like I can book it
> > before actually getting there. I will send exact details of the location
> > on Monday.
>
> Thank you for organising this.
>
> > Since we only have an hour, I propose that we focus on a couple of
> > topics and perhaps keep them anchored to the immediate future,
> > discussing evolutionary changes as opposed to grand schemes that will
> > require changing half the known world.
> >
> > I can discuss any of the following topics at length:
> >
> > 1. Current tools and automation offered at kernel.org, plus new features
> >    they are likely to see in the future that are interesting to both
> >    developers and maintainers:
> >     - public-inbox
> >     - patchwork
> >     - bugzilla
> >     - pr-tracker-bot and git-patchwork-bot
> >
> > 2. Proposed enhancements to the email-based workflow
> >     - cryptographic attestation of patches
> >     - adding (and requiring) base tree information in submitted patches/series
> >     - git-to-ML bridges ("turn this pull request into a well-formatted
> >       patch series and send it to the right places")
> >
> > 3. CI and bot integration
> >     - identifying the data that maintainers/developers want to see
> >     - communicating structured data over email
> >     - providing consumable feeds of CI/bot jobs (as public-inbox
> >       repositories?)
> >     - avoiding bug duplication
> >     - recognizing when a bug is fixed and following up on issues that
> >       nobody has taken on
> >
> > 4. Maintainer tooling
> >     - adaptability of existing tools for kernel development, such as:
> >       - GitHub/GitLab
> >       - SourceHut
> >       - Gerrit
> >
> >     - building on top of public-inbox feeds to create a tool that can:
> >       - track patches obtained from multiple sources (multiple mailing
> >         lists, individual developer feeds, bot activity feeds, etc)
> >       - collect the usual trailers (Reviewed-By's, etc)
> >       - show interdiffs
> >       - send automated templated replies
> >       - apply series to a local git repository (streamlining "save these
> >         patches as an mbox, make a new branch, run git-am")
> >
> > Unfortunately, that's enough topics to fill a 3-day mini-summit. :)
> > Which ones are folks most interested in discussing during the meet-up,
> > and which ones should be targeted for hallway discussions?
>
> I usually favour a top-down approach when discussing these topics,
> starting with the big picture. I would thus have proposed discussing how
> we can address the problems raised by the forge enthousiasts while not
> compromising on the requirements of the decentralisation advocates.

+1

Spot improvements to a single system are much less disputable.


> This being said, I think it would indeed take way more time than we have
> allocated for this meeting. We could this pick one of the tools that we
> think has the most potential today, and discuss how to move it towards
> our long term goal that we haven't agreed on yet :-)
>
> I think the maintainer tooling topic is the one that would benefit the
> most from face to face discussios as there's more brainstorming there,
> while the other three could possibly be discussed by e-mail more easily.
