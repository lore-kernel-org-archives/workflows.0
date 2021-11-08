Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F3C433EF
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 20:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0AF7619E2
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 20:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhKHVBG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 16:01:06 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:56798 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230126AbhKHVBG (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 8 Nov 2021 16:01:06 -0500
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Nov 2021 16:01:06 EST
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 352891F953;
        Mon,  8 Nov 2021 20:49:24 +0000 (UTC)
Date:   Mon, 8 Nov 2021 20:49:23 +0000
From:   Eric Wong <e@80x24.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: lei: incorrect quoting on saved searches (was Re: lore+lei:
 getting started)
Message-ID: <20211108204923.GA12823@dcvr>
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
 <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
 <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Mon, Nov 08, 2021 at 01:49:07PM -0600, Rob Herring wrote:
> 
> Moving this to meta.

I don't think workflows should've been dropped, though.

> > >     lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
> > >       --threads --dedupe=mid \
> > >       '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
> > >       OR ((nq:bug OR nq:regression) AND nq:floppy)) \
> > >       AND rt:1.month.ago..'
> > 
> > I tried a similar one which I had working as a bookmark:

That's actually treating the entire single-quoted section as
a phrase search for Xapian.

The correct way to use '(', ')', and '*' on the command-line for
Xapian is to shell escape them:

	lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
		--threads --dedupe=mid \
	\( dfn:drivers/block/floppy.c OR dfhh:floppy_\* OR s:floppy \
		OR \(\(nq:bug OR nq:regression\) AND nq:floppy\)\) \
		AND rt:1.month.ago...

Since shell escaping so many metacharacters is annoying,
stdin is supported (and implicit iff file|pipe):

	echo '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
		OR ((nq:bug OR nq:regression) AND nq:floppy)) \
		AND rt:1.month.ago..' | \
		lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
		--threads --dedupe=mid
