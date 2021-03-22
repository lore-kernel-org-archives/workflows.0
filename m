Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CF4C433DB
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 18:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FCE261990
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 18:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhCVSex (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Mar 2021 14:34:53 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:38044 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhCVSe3 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 22 Mar 2021 14:34:29 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id B5FFD1F9FC;
        Mon, 22 Mar 2021 18:34:27 +0000 (UTC)
Date:   Mon, 22 Mar 2021 18:34:27 +0000
From:   Eric Wong <e@80x24.org>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        ksummit-discuss@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: create mailing list "linux-issues" focussed on issues/bugs
 and regressions
Message-ID: <20210322183427.GA1195@dcvr>
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
 <20210322171636.fkep2lby6gnve4su@chatter.i7.local>
 <e93ad98a34828a4140fa59c1fb5b01f03c6f4245.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e93ad98a34828a4140fa59c1fb5b01f03c6f4245.camel@HansenPartnership.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Mon, 2021-03-22 at 13:16 -0400, Konstantin Ryabitsev wrote:
> > On Mon, Mar 22, 2021 at 04:18:14PM +0100, Thorsten Leemhuis wrote:
> > > Note, there is a second reason why ksummit-discuss is CCed: another
> > > reason why I want to create this new list is making it easier to
> > > find and track regressions reported to our various mailing lists
> > > (often without LKML in CC, as for some subsystems it's seems to be
> > > custom to not CC it). 
> > 
> > FYI, there will soon be a unified "search all of lore.kernel.org
> > regardless of the list/feed source" capability that may make it
> > unnecessary to create a separate list for this purpose. There's
> > active ongoing work in the public-inbox project to provide parallel
> > ways to follow aggregate topics, including query-based subscriptions
> > (i.e. "put a thread into my inbox whenever someone mentions my
> > favourite file/function/device name"). This work is not complete yet,
> > but I have great hopes that it will become available in the next
> > little while.

Yes, making progress and learning new tricks to make the WWW UI faster :>

> > Once we have this ability, we should be able to plug in multiple
> > sources beyond just mailing lists, including a feed of all
> > bugzilla.kernel.org changes. This should allow someone an easy way to
> > query specific bugs and may not require the creation of a separate
> > list.
> > 
> > I'm not opposed to the creation of a new list, of course -- just want
> > to make sure it's aligned with the improvements we are working to
> > make available.
> 
> I suspect the problem is that there's no known useful search string to
> find a bug report even given a searchable set of lists, so the main
> purpose of this list would be "if it's on here, it's a bug report" and
> the triage team can cc additional lists as appropriate.  Then we simply
> tell everyone to send kernel bugs to this list and ask maintainers to
> cc it if a bug report shows up on their list?

It seems having "bug" or "regression" in the subject could be sufficient?

"s:Regression" or "s:Bug" can be used to query messages reasonably
quickly:

https://80x24.org/lore/all/?q=s:Bug || https://yhbt.net/lore/all/?q=s:Bug
http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/?q=s:Bug
