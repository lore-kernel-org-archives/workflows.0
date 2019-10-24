Return-Path: <SRS0=kvgU=YR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B35CA9EAF
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B901A20663
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OPYD6mLK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390574AbfJXNdS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Oct 2019 09:33:18 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38373 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388422AbfJXNdS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 24 Oct 2019 09:33:18 -0400
Received: by mail-qk1-f194.google.com with SMTP id p4so23398982qkf.5
        for <workflows@vger.kernel.org>; Thu, 24 Oct 2019 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2A5dMl1Z1W1jiGJhEk8i9wlqv2wXK80gp7FhyIyQjA8=;
        b=OPYD6mLKLlxBHhrt+sCE87cINg+SmI8MBun3Xk919pXDc6hMOoacgTDsuwtiMFiJrN
         VLCC32FtHWrsf7oWQmtwaJzaoZKVkWjrMWy/i4ZZRcXRtqmF+G6mRJRPElzxnSADgNGJ
         PbQaGgRGpipEhFma2IYpicMpMxKoHdlp4r/QfKLnaEyk+7dfCimqsrJ77bhftLjIzn1/
         0c1aIGDWauqIk1PoH1TFRtcZRUi8sAdHMJH2fJBzzcJQ7dtuUAqLbo17jy6NXy9KiBQ4
         QkBRkspOl5erDXRazWj/DATaNhj92+N10yGfpJ8XLRQpF1REhBxCtC8bE9GM1z0HhipA
         SyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2A5dMl1Z1W1jiGJhEk8i9wlqv2wXK80gp7FhyIyQjA8=;
        b=mfaVKI9tIAyMGHU1HQHLpsbalHxDS78rJ27g5xSpaoEeyy2+sFkSeliik9APc/ELY2
         yONLKjjoJsdKaSCGOkE8aEcYaV7wp2vVQlxsI3wokC2+xcsbS3UsYqlRF32iso47CAfI
         PZZCz4bvRpH8pq+533KV1UKDtauahOINT2sjB5gaHB8UrGmX2VcHzNfiDmLUF1sjc5HK
         GoPH6ViDSj4UFks4eR85nUQ06gbhcBiu7tZVMqT+4iJag/EjNJaRO45rmdm102EJJItV
         UcelhjSXDaB84aBvIjebRGV7bP6pXu8Kg78FMQnmQhb09omi56WPZahy78B6y32j30Uh
         tvWw==
X-Gm-Message-State: APjAAAUcucCfpsUHKmDynAqnXzjPcMWSNuYhnZkPOP7GTBFR7QRs2s2p
        gYw6U8G+Jwj1Hzyf5vseNjHHnu4tIGulO8c5HLsGqw==
X-Google-Smtp-Source: APXvYqzLJR2AwpSLnqOEO0CYp8huzcsxz3ubtGcIHg626HoLaPn5HlXTJsx+bZT4HeFuhOkbPEGfk1PUGqZL2TV+QLI=
X-Received: by 2002:a05:620a:2115:: with SMTP id l21mr1306879qkl.407.1571923996657;
 Thu, 24 Oct 2019 06:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu> <20191015083741.1d0731e5@gandalf.local.home>
 <20191015163704.GJ4875@pendragon.ideasonboard.com> <20191015124749.1a11926f@gandalf.local.home>
 <20191021153918.GE4947@pendragon.ideasonboard.com> <20191024091541.10af3417@gandalf.local.home>
In-Reply-To: <20191024091541.10af3417@gandalf.local.home>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 24 Oct 2019 15:33:04 +0200
Message-ID: <CACT4Y+am=FxEkMYFz8JZXP8GUOEzOPF=6h_s_04HbozU6BJkVQ@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 24, 2019 at 3:15 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 21 Oct 2019 18:39:18 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > > I plan on continuing to develop mostly in email (I still send my patch
> > > series via quilt!). But I'm not going to enforce everyone to continue
> > > to use email if we can come up with a better way. I also want to make
> > > sure that whatever we do come up with will still support email.
> >
> > Hypothetically speaking, if there was a service that allowed sending a
> > patch series through a git push with a tag containing a cover letter in
> > its message, and that service would send out e-mails to mailing lists
> > (with the option to self-host it if you want), would you consider using
> > it ?
>
> Only if I was forced to ;-)
>
> Seriously, it's hard to teach an old dog new tricks. I wont change
> until it becomes necessary to do so. As the old saying goes: "Don't fix
> what ain't broke!"
>
> I've developed a workflow over the past decade or so, that I've
> optimized to fit my needs. Why would I want to change that? Unless
> there's something that changes that can make an impact on my
> efficiency.


Purely theoretically let's consider that the changes do not improve
_your_ efficiency, but they significantly improve overall project
efficiency by positively affecting people who did not develop a
workflow over the past decades (maybe there were not around 2 decades
ago) and positively affecting various tooling that _you_ may be
directly interested in, but otherwise they are important for the
project overall. So for you it's no change in efficiency except that
you now need to do things differently. What do you think about such
changes? Are you ready to force yourself? :)
I think it's quite cornerstone question here. All (?) major figures in
the kernel (who are ~~98% of decision making, but ~~2% of kernel
developers overall) have developed workflows over the past decades
that work reasonably well for them. If they veto all proposed changes
based on the criteria you described, every new contributor will need
decades to develop own workflows to become an efficient contributor
and lots of tooling will be painfully hard to do.


>I've created a bunch of scripts that do exactly what I
> expect them to. To change, I'm going back into the world of the unknown,
> and will need to take up time (which I'm struggling to come up with),
> to learn something new that may or may not make it better for me.
>
> The tool I would like is simply something where all the patches I
> receive are stored in a nice formatted database that I can process
> offline somewhere (like when I'm flying to Europe).
>
> Right now I hacked an old version of patchwork (when I upgraded,
> everything broke, and I had to revert it), along with procmail, that
> creates a local patchwork queue I can access locally. Unfortunately,
> this doesn't work when I'm away from home without an internet
> connection.
>
> I would love to be able to take this database with me and process the
> patches while traveling without connectivity.
>
> -- Steve
