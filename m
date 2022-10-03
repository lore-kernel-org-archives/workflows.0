Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011D8C433F5
	for <workflows@archiver.kernel.org>; Mon,  3 Oct 2022 14:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiJCOWs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Oct 2022 10:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiJCOWq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Oct 2022 10:22:46 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5245D36785
        for <workflows@vger.kernel.org>; Mon,  3 Oct 2022 07:22:44 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id i9so3461989qvu.1
        for <workflows@vger.kernel.org>; Mon, 03 Oct 2022 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1mNtnrUJyTQxjM/H58kPO2FBj8ctREemEmZLeJQjiiA=;
        b=HHOvlrEsLsjIt8pkWJIJaNi/7w9fH7/+USdEgJk/pasP39/PqJRX9gJNl+6RLSmCMf
         GVyofV26jlyTxOmuA6eiwfdzwft095SM77pgF3xPOqSYIty+eZ6BqJxbjuVad1yp9Zty
         Plox52neU37WQikTvfXrSDCcANY2b6vl+JjSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1mNtnrUJyTQxjM/H58kPO2FBj8ctREemEmZLeJQjiiA=;
        b=v9tCbBrtuacP5/Bw2ux8Zmdcxnd4xJft5maJn7gE9vfLj73lFoLpNbc1uF9a0M3XUK
         S3R7egCcfEIJkwqIfIDf7/1cNhRwEKzQ0TslPo1DHAqkMGMCi5z3V2zlCJ5+ZR4F3fW7
         V7DDyVbAUaN5IPBtBCvl1yVtjj2whYdJNwfT3oO0hYeWnE8kkjYIZTF7CPl4H4iAlG/0
         zL+eSl2McGSTfOb/xExGnmotL/tJQzG8Pq7zH/rYgBT6gCquXhxuyf5ztj8z5wEBmwae
         dHfC1BpNWvslmcVotNWsVX0/Fz5JNZ2cAKu/t0ABlxDN4ecygeNMpWehJFDsV2ssDdUc
         40cQ==
X-Gm-Message-State: ACrzQf1/Z3+LxiwSN2tjxIoPfEliqHC2S69O1xE1/EIWUWqvtXv69ZWq
        Pz7aN8kC+y4TBtaFOIHoNo9wSw==
X-Google-Smtp-Source: AMsMyM40Bz2C89dANTyCDKluBnuuyuFRbPI6+PRG0AjqrNrChvyQCbzmIZu+Hwe3O2nDYy3wQo9z+Q==
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id 8-20020a0562140d0800b004b17127f615mr10560443qvh.92.1664806963423;
        Mon, 03 Oct 2022 07:22:43 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id p3-20020a05622a00c300b0035d0a021dcasm10246739qtw.63.2022.10.03.07.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:22:42 -0700 (PDT)
Date:   Mon, 3 Oct 2022 10:22:40 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003142240.hu5gj7fms5wdoujk@meerkat.local>
References: <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 03, 2022 at 09:16:06AM +0000, Artem S. Tashkinov wrote:
> The initial conversation started with the fact that Bugzilla is old,
> semi-deprecated, requires MySQL [no idea what's bad about it, Bugzilla
> can work with MariaDB and Percona as well]

It can't, actually. It only works with MySQL 5.7 or an equally ancient MariaDB.
No, there is no official fix (because nobody is working on bugzilla).
https://bugzilla.mozilla.org/show_bug.cgi?id=1592129

-K
