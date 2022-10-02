Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABD5C433FE
	for <workflows@archiver.kernel.org>; Sun,  2 Oct 2022 15:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiJBPF1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 2 Oct 2022 11:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJBPF0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 2 Oct 2022 11:05:26 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4D52982B
        for <workflows@vger.kernel.org>; Sun,  2 Oct 2022 08:05:25 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id f26so5200437qto.11
        for <workflows@vger.kernel.org>; Sun, 02 Oct 2022 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=AHvB1LhxqYGQ+cvJZ/ZLhP5iW42Hxxwy2UK+oyB6pSM=;
        b=SwS7y3mxPoGvcLbTppPPg8NxTIbZNq9+b7LR8wMo9VEuSSm60PTGaMxuOtt4ZhHQnk
         nhjWeuhJWH/+kt1XdRukCmYt4ejosHAAw0hv8h/kZ0Q4FA9FCN+JLKcm7TvT8kWxyZ7M
         h8Qe+H11Rt7UWPYhAsPgzy/l47t6ErCOYSAfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AHvB1LhxqYGQ+cvJZ/ZLhP5iW42Hxxwy2UK+oyB6pSM=;
        b=uJUd+yBaIeTGEMWC9wwdC6dNj090MlUZtm9+B5uHKercToh1z8aeQqSiESgxGd4+mL
         55ip4b1jHoDGUyIf6LdvXu2mGilA5QK6GnQPTNI6p6hXW3/utg3wjDdhkkSUh0aperAe
         PZJvZlCWRKGFkrMW1SlTiEHSvBIQ/mTOSB0CyUk+F9w/idZVcmgF/XX5lLDaeim096zc
         BCbPBn0dlcT+5+wWlHZeYjAxv+a4vvBjNfNjEqg1QZAoDQpOWy8axEWlODoM40WaYLCn
         QfmDu2F0ItDyxlU7N/FlaOuBBoTpMVObiwsd51pmWH4Ko1+GumQqOGmuePTvb1IQCdod
         sTrA==
X-Gm-Message-State: ACrzQf3GLxFNWEX8alsQn0gbWJBs96E/g+PyE2T5LRtFYJEgnXATU36F
        HLQd4FTdxFjYHBQOWv7L9DiS+xUjsID2wQ==
X-Google-Smtp-Source: AMsMyM6jM42HuWSty9Dqk78kBFQhlHrUXm6dkLDU/3xGYpVYn7teRmKAU9Ha43bsW+znhD14NzUcOQ==
X-Received: by 2002:ac8:5992:0:b0:35c:c83a:740f with SMTP id e18-20020ac85992000000b0035cc83a740fmr13590700qte.503.1664723124389;
        Sun, 02 Oct 2022 08:05:24 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a1-20020ac844a1000000b00339163a06fcsm7080311qto.6.2022.10.02.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 08:05:23 -0700 (PDT)
Date:   Sun, 2 Oct 2022 11:05:22 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221002150522.ul4nbtfawqjhnsag@meerkat.local>
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Oct 02, 2022 at 12:49:04PM +0000, Artem S. Tashkinov wrote:
> I've mentioned it a dozen times already - you're unhappy with emails
> from bugzilla? Go there and unsubscribe. It takes a minute and we're
> talking as if it's the actual issue we are dealing with. It's not.
> Bugzilla maintenance and its up-to-date status are the issues.

I think you're working from the wrong conception that maintainers want to
receive (or even be aware) of bug reports. Maintainers want *PATCHES*, not bug
reports. You're asking senior engineers to do first-line QA.

This is why your suggestion to auto-subscribe maintainers to bug reports is
the absolutely wrong way to go about it. The maintainers will complain that
they're being inundated with spam and junk reports, and bug reporters will
complain that they are being treated rudely (because this is how a senior
engineer trying to get succinct information comes across). You know that meme
from Fallout with the words "[Everyone hated that]" on it?

> > And if we force developers to get Bugzilla spam whether they want it
> > not, and they said, "absolutely not", is it there right to have the
> > mailing list gateway disabled --- and if so, what does that do to the
> > user experience?  Thats basically the situation we have right now.
> 
> As I've said many times already: bugzilla must be an opt-out, not opt-in
> experience/option.

Please listen to the actual maintainers telling you that this won't work and
will just lead to bugzilla being added to everyone's block list (that's even
faster than logging in to bugzilla, finding where to change the default
assignee, etc).

-K
