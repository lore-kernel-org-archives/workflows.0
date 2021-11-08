Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8ECC433EF
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 21:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A787A614C8
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 21:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240606AbhKHVvV (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 16:51:21 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:55358 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240591AbhKHVvV (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 8 Nov 2021 16:51:21 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 64C741F953;
        Mon,  8 Nov 2021 21:48:36 +0000 (UTC)
Date:   Mon, 8 Nov 2021 21:48:36 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, meta@public-inbox.org,
        workflows@vger.kernel.org
Subject: Re: lei: incorrect quoting on saved searches (was Re: lore+lei:
 getting started)
Message-ID: <20211108214836.GA21665@dcvr>
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
 <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
 <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
 <20211108204923.GA12823@dcvr>
 <20211108213613.4hjtbokwzar7x4ph@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108213613.4hjtbokwzar7x4ph@meerkat.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Mon, Nov 08, 2021 at 08:49:23PM +0000, Eric Wong wrote:
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > > On Mon, Nov 08, 2021 at 01:49:07PM -0600, Rob Herring wrote:
> > 
> > > > >     lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
> > > > >       --threads --dedupe=mid \
> > > > >       '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
> > > > >       OR ((nq:bug OR nq:regression) AND nq:floppy)) \
> > > > >       AND rt:1.month.ago..'
> > > > 
> > > > I tried a similar one which I had working as a bookmark:
> > 
> > That's actually treating the entire single-quoted section as
> > a phrase search for Xapian.
> 
> Hmm... I noticed that when I `lei edit-search` the initial query that was
> causing quoting issues, I get the following:
> 
> 	[lei]
> 		q = (dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org
> 
> So, the extra quotes didn't get added to the config file. Running `lei up` on
> that saved search seems to do the right thing, so the erroneous quotes are
> only added during the initial `lei q` call.

Right, each entry in lei.q is actually an entry in argv[].
So the correct query should look something like:

[lei]
        q = (
        q = dfn:drivers/block/floppy.c
        q = OR
...

> > The correct way to use '(', ')', and '*' on the command-line for
> > Xapian is to shell escape them:
> 
> But putting them into single quotes should accomplish the same result, no? At
> least, that's how I've always understood shell escaping.

Yeah, that works, too.  As long as spaces/tabs don't show up
within each argv[] element, it won't be interpreted as a phrase.

I really wanted:	lei q s:"a quick brown fox"
to work from a shell like it would in the WWW UI;
and thus deprioritized '(' and ')' working properly :x
