Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B833C433F5
	for <workflows@archiver.kernel.org>; Sun,  2 Oct 2022 20:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiJBU0g (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 2 Oct 2022 16:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiJBU0f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 2 Oct 2022 16:26:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024F523BC9;
        Sun,  2 Oct 2022 13:26:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BE58505;
        Sun,  2 Oct 2022 22:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664742392;
        bh=ifC2YynmFadjz4H6NewKGY2t8YFdosjpxwZURKUFVgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WFWxXj3vHlkEhlKZNAUxKPaOk48+eKyFuF+BKHoNmPMXzN3zEuMI4TYfobH8Jj0z+
         7hF+v3N3vR8LM33OemlCkZ7L2RbjItxZU5CjjCDt0nHrZIbw39kk7NiYKu0tnldjT7
         R86Ivn3SKDJ4roCjstBFUhpVLHiFRoJFCBdiCNS8=
Date:   Sun, 2 Oct 2022 23:26:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yznz9lBStaeQ0gOI@pendragon.ideasonboard.com>
References: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <Yznti0ca4g/hsm/T@pendragon.ideasonboard.com>
 <68170af3-1692-affc-afcf-77a3f574ac3c@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68170af3-1692-affc-afcf-77a3f574ac3c@gmx.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Oct 02, 2022 at 08:19:44PM +0000, Artem S. Tashkinov wrote:
> On 10/2/22 19:59, Laurent Pinchart wrote:
> >> Let's subscribe the past six months of developers using git commits and
> >> if someone doesn't like getting emails they go to the website and
> >> unsubscribe _once_ which takes a minute. This is a non-issue I've no
> >> clue why we're dwelling on it.
> >
> > I'm not sure that would be legal, at least in the EU.
> 
> 1. That's already been done at least once AFAIK.
> 2. I'm talking about emails in public domain (git log). It's not a
> special forces operation to exfiltrate an email database.

That may or may not matter. If we decided to go in that direction (this
doesn't seem to be the consensus so far, but that could change), we
would need legal vetting.

-- 
Regards,

Laurent Pinchart
