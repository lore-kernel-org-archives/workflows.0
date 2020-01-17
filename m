Return-Path: <SRS0=lg0B=3G=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16029C33C9E
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 20:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE4272072E
	for <workflows@archiver.kernel.org>; Fri, 17 Jan 2020 20:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QvPquPCc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgAQUir (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 17 Jan 2020 15:38:47 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:34777 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgAQUir (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 17 Jan 2020 15:38:47 -0500
Received: by mail-io1-f52.google.com with SMTP id z193so27431052iof.1
        for <workflows@vger.kernel.org>; Fri, 17 Jan 2020 12:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqmsBiwr011pyzKyb5FHF936IIJEBnZtjF4lIgfbW6k=;
        b=QvPquPCcXFUocKoR39fP5V5VhThkh2+HUC4h9opL+k5gg2tLvpUjNmvXruY9SUxoLa
         +Fh28L5kHEH5LK9ur2q93IwEMFqt1ayFrTSnSsvrRvhQoV2oIM+Ew5xOy16Yh0mQFESq
         QQlCsymAwS22UrCBcibPu8lFI9xAcxyciLMN/MdZ7toZdv6LTg2Tb2y0VTF94PUNZ9wJ
         7P8K2rMDzAOezlLlMsDZXe5vHTbUxVMJwsO6a6VmOhxJLv0wJnuGRustZFsG67WKkjMI
         uaz/oRWBpbCko+HUCnzFPKFe87zhGyfSoGB9ZvO/rqrSQqKdXhYyl6wmhxHGoJ4tAO+D
         t7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqmsBiwr011pyzKyb5FHF936IIJEBnZtjF4lIgfbW6k=;
        b=GchxiGyzKVjvIJtLd1WHj+WpDo+YoKg50Zrv64Fuse6D6bsT03Y6UoTBOgkJauHExN
         LObkb6R2D9mfSB7Z9D+A6IKpQJlWt6PrTfle8p9FDJjlIFYHXyNMXRPf/1MCca3lkuFG
         Cymh9ZU0oBYYdm726hYOIGW5P0yuCKrhbW/ftdzmV1BIlqTUAE/IS16HCmpK2rIr5Qvl
         JvvYco56pjBtJiuTFHGmEPXmmoOZ4FlIF5zC7tfKgkgZnTLql1WQSCaEfoZfeiNlJ8SW
         hGm2HqJ+JGGnw3x+NiaoVeE5I4dTb4elly1xxRuLXRrh88Va0pc4xr7gEO2a9u4PMebg
         nTlw==
X-Gm-Message-State: APjAAAXIsW8ZzByVSIgesOpR8PfXDXAF5777i6m8272QFdg/kAsx923F
        WsrVxlWbgMez+OrBPs4QnGiHUuwTPGpstXY7+IXIiA==
X-Google-Smtp-Source: APXvYqwKQUv/zoo75YzFOEhhN8Jim375Cjg32s6DHSo18/R989BIf07uN4cojOpNBZgWqOYLvZi3G2S2DQNGjnVPqKk=
X-Received: by 2002:a5d:9742:: with SMTP id c2mr32953164ioo.165.1579293526408;
 Fri, 17 Jan 2020 12:38:46 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com> <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
In-Reply-To: <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 17 Jan 2020 12:38:20 -0800
Message-ID: <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jan 17, 2020 at 12:25 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Wed, Jan 15, 2020 at 11:07 PM Michael Turquette
> <mturquette@baylibre.com> wrote:
> >
> > I added the first entry, "Bidirectionally sync Patchwork patch status
> > with Gmail labels". Stephen Boyd and I use a local solution to
> > coordinate patches in the Linux Clk tree. Our solution requires
> > Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> > proposal is to remove the Notmuch requirements and teach Patchwork to
> > talk directly to Gmail (and vice versa), perhaps via a solution in the
> > cloud, running on a server somewhere, and not dependent on the uptime
> > of my laptop.
> >
> > From my discussions with kernel devs, I believe there is a reasonably
> > sized Venn diagram of people that use both Patchwork for patch
> > tracking as well as Gmail/G Suite for email. Having those two talk
> > might mean that I never have to use the Patchwork web interface again,
> > a big win IMO, and I can just use email.
> >
>
> Michael, thanks for this first proposal. Would you also be interested
> in mentoring this project idea or should we ask and look for potential
> mentors for this project?

I would be interested in learning more about the duties and
expectations of mentorship. Do you have a link? If it's not too much
work to add to my load then consider me interested.

Best regards,
Mike

>
> Of course, more proposals are welcome :)
>
>
> Lukas



-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
