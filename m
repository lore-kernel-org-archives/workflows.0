Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D6EECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FCB1214E0
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TBtnYru6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfJKTMg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 15:12:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39254 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbfJKTMg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 15:12:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7A7433A;
        Fri, 11 Oct 2019 21:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570821153;
        bh=bYhwvw9Q1xiePX+A8Ty+LD86ZEDK2oBGVRSWyq7hk7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TBtnYru6EnwaMXdfvP8oiTWM5VRCeqrTc8uYfVEzrw5/KhONM5FgYNA1d8YnWmdLN
         MBtoNEThuMB8kb0XQbV+BbCZtUvr71GA5LG/sHft4aw+xS1xe8s47hmr0fK7JQgL2W
         9z3cWTOVPfQRrugMH8a9u+cgMoOVCmgmYTXLHk9U=
Date:   Fri, 11 Oct 2019 22:12:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191011191231.GH4882@pendragon.ideasonboard.com>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
 <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
 <CAMuHMdU1cdWEfeH9pJESnVrUgWxEfcRO=c6CL=UJa7UVOkvD+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1cdWEfeH9pJESnVrUgWxEfcRO=c6CL=UJa7UVOkvD+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 09:07:20PM +0200, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Fri, Oct 11, 2019 at 7:15 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > I also tend to conclude that some actions should not be done offline
> > and then "synced" a week later. Ted provided an example of starting
> > tests in another thread. Or, say if you close a bug and then push than
> > update a month later without any regard to the current bug state, that
> > may not be the right thing. Working with read-only data offline is
> > perfectly fine. Doing _some_ updates locally and then pushing a week
> > later is fine (e.g. queue a new patch for review). But not necessary
> > all updates should be doable in offline mode. And this seems to be
> > inherent conflict with any scheme where one can "queue" any updates
> > locally, and then "sync" them anytime later without any regard to the
> > current state of things and just tell the system and all other
> > participants "deal with it". Also, if we have any kind of
> > permissions/quotas, when are these checks done: when one creates an
> > update or when it's synced?
> 
> Not unlike "git push" accepting fast-forwards only, and rejecting
> forced updates.
> Hence you cannot push the close of a bug (each bug has its own
> branch?) before merging the updated remote state first.

That might work in small projects, but at a bigger scale you soon start
hitting races to get to the build bot before everybody else, and the CI
system gets trashed with cycles of lost races, rebase and retry. It's
not something we could enforce globally.

-- 
Regards,

Laurent Pinchart
