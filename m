Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF26E95A66
	for <workflows@archiver.kernel.org>; Sat,  7 Oct 2023 16:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344025AbjJGQka (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 7 Oct 2023 12:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343956AbjJGQk3 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 7 Oct 2023 12:40:29 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A02EBA;
        Sat,  7 Oct 2023 09:40:23 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 397GdaTL026853;
        Sat, 7 Oct 2023 18:39:36 +0200
Date:   Sat, 7 Oct 2023 18:39:36 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Solar Designer <solar@openwall.com>
Subject: Re: [RFC PATCH] Documentation: security-bugs.rst: linux-distros
 relaxed their rules
Message-ID: <20231007163936.GA26837@1wt.eu>
References: <20231007140454.25419-1-w@1wt.eu>
 <5ae47535-b6e0-8b48-4d59-a167e37c7fcc@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ae47535-b6e0-8b48-4d59-a167e37c7fcc@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Vegard,

On Sat, Oct 07, 2023 at 06:30:11PM +0200, Vegard Nossum wrote:
> 
> On 07/10/2023 16:04, Willy Tarreau wrote:
> > +As such, the kernel security team strongly recommends that reporters of
> > +potential security issues DO NOT contact the "linux-distros" mailing
> > +list BEFORE a fix is accepted by the affected code's maintainers and you
> 
> is s/BEFORE/UNTIL/ clearer?

Probably, yes.

> > +have read the linux-distros wiki page above and you fully understand the
> > +requirements that doing so will impose on you and the kernel community.
> > +This also means that in general it doesn't make sense to Cc: both lists
> > +at once, except for coordination if a fix remains under embargo. And in
> > +general, please do not Cc: the kernel security list about fixes that
> > +have already been merged.
> 
> I was thinking about this Cc: thing and would it make sense to:
> 
> 1) have LKML and other public vger lists reject messages that include
> s@k.o or (linux-)distros@ on Cc? The idea being that this is probably a
> mistake -- I believe it has happened a few times recently by mistake.
> 
> 2) have (linux-)distros@ reject NEW threads (i.e. no In-Reply-To:) that
> also include s@k.o on Cc? We could include a nice message explaining why
> and to please resend when a patch has been developed and/or a disclosure
> is planned in the next 7 days.

I don't know, maybe it would add extra config burden, but on the other
hand it could avoid the mistake from newcomers who have not read the
docs first (which happened a few times already), but if l-d becomes a
bit more flexible and tolerant to reporters' mistakes, as now documented,
it should also be less of a problem.

> I guess the problem with this would be if
> somebody on s@k.o does a reply-all which would add distros right back in
> the loop -OR- a patch has already been developed and included.

Then this would be deliberate, there would an in-reply-to so that would
not be a problem. I really doubt anyone from s@k.o would Cc linux-distros
anyway since it would imply disclosing some details from a reporter, and
we do not do that, it's up to the reporter to do it if they want.

Thanks,
Willy
