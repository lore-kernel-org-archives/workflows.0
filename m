Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976E0C7EE22
	for <workflows@archiver.kernel.org>; Thu, 11 May 2023 16:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237852AbjEKQGU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 11 May 2023 12:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238412AbjEKQGT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 11 May 2023 12:06:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9118159C6
        for <workflows@vger.kernel.org>; Thu, 11 May 2023 09:06:17 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-51452556acdso5878522a12.2
        for <workflows@vger.kernel.org>; Thu, 11 May 2023 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683821177; x=1686413177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjcQw5qfoWhZrHShMenKyn6N6JRDwRPKfT0j3vGPb74=;
        b=O99GbI7t2R7iCSmuWqIAWRBpWiqB5S/bkuc71mZR9seDW2TcyxC4NWNMQr8lVBcHh1
         ktf8bgGWxvwJzfDEmy0q2E/gnPMr2u+QXjAEfPyXnQx5eokWsKyerUoh/nAOEzEkT1tX
         jmIyPIGMJykQ1GWWv4ZeOBG97LMOEMlqeSvz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821177; x=1686413177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjcQw5qfoWhZrHShMenKyn6N6JRDwRPKfT0j3vGPb74=;
        b=T4QJGtF7xN32/JHHuyzhtnOeHPO/EcEDYIoRBUP7GQs0SwPStvD8czh4CwtuEdCsJw
         pcSBrJyzXDW9jaNA5gHKrP6v25LmQ0s3GLlpJYQPfUPwOJFPdMLhJw3ki+qy4QOTSKoW
         Z1Qymj/1GbMD8tMV7vt02Y0FhAyiOe+2GwaPa/VHg2+kC2b8vKzhVzkSYgQJH/C5hi4b
         Uk4m9ZYvPMK+0smf6ovCf1PmP2g2l7KU9tkbVjatl6Vny49spaWi9rK2SmSVWs9Asg2p
         LMXlgCrf2J9K0oQbvUYSZseGs2l0ToZz7Zqf+tenNBpeJGhG0OhLgU4ULn9u1lxlFt/l
         R73Q==
X-Gm-Message-State: AC+VfDwPLEqkTP0f4TawtPKfAz98id3lXfxsqWYKaV4FOkDoViQvWT8l
        qxHznV7fzc/nq6rFmL+qBFuCjQ==
X-Google-Smtp-Source: ACHHUZ4T7fGPw6RhgXB3YhPDAVdBil7K8ZjbNA7hvHIB3GIJ2h84kwHUsXVjfo+wUT2IQqmnyofUhA==
X-Received: by 2002:a17:90a:dd8d:b0:252:98ca:e7ac with SMTP id l13-20020a17090add8d00b0025298cae7acmr1639114pjv.44.1683821177052;
        Thu, 11 May 2023 09:06:17 -0700 (PDT)
Received: from nitro.local ([2001:4958:15a0:30:e305:5a3c:4c5a:1bc7])
        by smtp.gmail.com with ESMTPSA id q22-20020a656256000000b005287a0560c9sm4989386pgv.1.2023.05.11.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:06:16 -0700 (PDT)
Date:   Thu, 11 May 2023 12:06:14 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>,
        Hayes Wang <hayeswang@realtek.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Stanislav Fomichev <sdf@fomichev.me>, workflows@vger.kernel.org
Subject: Re: [regression] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Message-ID: <20230511-tart-asthma-girth-11164c@meerkat>
References: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info>
 <87lei36q27.fsf@miraculix.mork.no>
 <20230505120436.6ff8cfca@kernel.org>
 <57dbce31-daa9-9674-513e-f123b94950da@leemhuis.info>
 <20230505123744.16666106@kernel.org>
 <9284a9ec-d7c9-68e8-7384-07291894937b@leemhuis.info>
 <20230508130944.30699c33@kernel.org>
 <71f119ab-24e2-6a35-2b7d-43ea2a9578b8@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71f119ab-24e2-6a35-2b7d-43ea2a9578b8@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, May 11, 2023 at 03:25:47PM +0200, Thorsten Leemhuis wrote:
> > The bugbot can be enabled per BZ entry (AFAIU), so you can flip it
> > individually for the thread you want to report. It should flush that 
> > BZ to the list. At which point you can follow your normal ML regression
> > process.
> > 
> > Where did I go off the rails?
> 
> You missed that Konstantin (now CCed) is just a bit careful for the
> bugbot bring up and therefore for now only allows bugbot to be enabled
> for BZ entries that are filed against the product/component combination
> Linux/Kernel. I could reassigning bugs there, but that would break the
> workflow for maintainers like Kalle, which look at all bugs assigned to
> their product/component combo (Drivers/network-wireless in Kalle's case).

I hope to start opening this up to other products within the next few weeks,
as things are looking fairly stable for our initial tests.

-K
