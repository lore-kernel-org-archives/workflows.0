Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E639C433F5
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 22:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E82A6614C8
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 22:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhKHXAf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 18:00:35 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:37462 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237259AbhKHXAe (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 8 Nov 2021 18:00:34 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 3BFD11F953;
        Mon,  8 Nov 2021 22:57:47 +0000 (UTC)
Date:   Mon, 8 Nov 2021 22:57:47 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, meta@public-inbox.org,
        workflows@vger.kernel.org
Subject: Re: lei: incorrect quoting on saved searches (was Re: lore+lei:
 getting started)
Message-ID: <20211108225747.GA11051@dcvr>
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
 <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
 <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
 <20211108204923.GA12823@dcvr>
 <20211108213613.4hjtbokwzar7x4ph@meerkat.local>
 <20211108214836.GA21665@dcvr>
 <20211108223657.jhsssoumfbmf4dhw@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108223657.jhsssoumfbmf4dhw@meerkat.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Mon, Nov 08, 2021 at 09:48:36PM +0000, Eric Wong wrote:
> > > Hmm... I noticed that when I `lei edit-search` the initial query that was
> > > causing quoting issues, I get the following:
> > > 
> > > 	[lei]
> > > 		q = (dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org
> > > 
> > > So, the extra quotes didn't get added to the config file. Running `lei up` on
> > > that saved search seems to do the right thing, so the erroneous quotes are
> > > only added during the initial `lei q` call.
> > 
> > Right, each entry in lei.q is actually an entry in argv[].
> > So the correct query should look something like:
> 
> So, to be clear here... the following doesn't work because instead of multiple
> query parameters to 'lei q' the single-quoted string becomes a single
> parameter?
> 
> 	lei q -I https://lore.kernel.org/all/ -o ~/work/temp/lei/robh-patches \
>     --threads --dedupe=mid \
>     '(dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org'
> 
> Any way to make this work? I find that it's more easily readable than the
> "echo | lei q" version.

I can't think of a way to make it work w/o breaking phrase searches
(or asking users to use both single and double-quotes):

	lei q 's:"a quick brown fox"' # yuck

> For bash users, the following should work as well:
> 
> 	lei q -I https://lore.kernel.org/all/ -o ~/work/temp/lei/robh-patches \
>     --threads --dedupe=mid <<< \
>     '(dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org'

Oh, not sure about bash and <<<; but this heredoc should work with any
POSIX sh:

	lei q -I https://lore.kernel.org/all/ \
		-o ~/work/temp/lei/robh-patches \
		--threads --dedupe=mid <<'EOM'
(dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts)
AND f:robh@kernel.org
EOM

> Suggestion, can -I accept the URL containing the query, so that the command
> becomes:
> 
>     lei q -o ~/mail/foo --threads --dedupe=mid -I \
>     https://lore.kernel.org/all/?q=f%3Atorvalds+AND+nq%3Agarbage
> 
> This way we pass both the location of the extindex to query AND the parameters
> we should use, avoiding shell quoting problems?

Maybe, but URI escaping bothers the heck out of me, too.
I guess the heredoc example is actually good...
