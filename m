Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013AEC433EF
	for <workflows@archiver.kernel.org>; Tue, 30 Nov 2021 01:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbhK3BM7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhK3BM7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 29 Nov 2021 20:12:59 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0231C061574
        for <workflows@vger.kernel.org>; Mon, 29 Nov 2021 17:09:40 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id j2so47463082ybg.9
        for <workflows@vger.kernel.org>; Mon, 29 Nov 2021 17:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HuIlfyseBRn31T+CB6WiobKmXfymgi7xKS2SxyF/V5A=;
        b=blWVVvoSH2NFMks/n8oH3qDauMGlTsRl0H/cLHpdNSA57PtEUNC9ggjURr2cyqYzrE
         KojLEJjrybccExNp4lYvCNaoRKcVCRYkq21dreo73sdexgYpI5pMOLXjW6a/8InQ3uwu
         yKD6nUTyTwJBY947nAYbbMol2EjjoK4xFk7iQNH+kGochBNr9279Ll94mmmtxJcs3GF9
         W7RFenHc+ZX9GqpvsZXkbCu6fJDlDYJBXnYQaunpWvV7Wo5tnxVkoe9fOHiyIdpJmJfv
         UnV4MqgrbAuaQmFQaRewa59i7K8Jh9HD6TmSDEahcaKYnQLLf73w2NJJYEm2GltokyPX
         lnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HuIlfyseBRn31T+CB6WiobKmXfymgi7xKS2SxyF/V5A=;
        b=r62gtpA0NC9rOESPJgVoabBCDZTM94Zxd8lbjLeNWX0bdm9d+pR43WDJ9FbFzRykIN
         cMUyGWG2WgrPPl+xwv4IrMGso5VSwkI6k6GatfDbG19TRNfBWh0ysSgxl1D1ATBkXOsE
         a9ATj1cXo+qKzn2FSAl/sp6cxNSwMdosROAjL/Nw3JXEuOFdDexMTcJBG5ZGmDL+DDWY
         031Up8dz1vrYwWSJjmi14WhbgQr+KFfRBlS9GZVBJDW3BQ1calGN+lAn03GQ2kWXsBoA
         ZzYDXwH92bLcsbKwfi/Ln5GGwF8V10IF878DyVb7nOQAjceTkPjGV4l4rNv5Xag9yVtC
         C2dQ==
X-Gm-Message-State: AOAM533SPZiTP9jYFCnytdpRJ9B5hvfHjF1fRzTH9oZxLqdb9PyuAFXJ
        17Jna0LHf7tyMC0Buh/UckCHnZ7rkfyaBtS+esdXpUgoNGw=
X-Google-Smtp-Source: ABdhPJxQR+QMRXh9IdeYKnQOhINU2bMBpycWje8/9Y74db/KE7RImSxycxp6FUoiVKzR8UzyhMdOT4FF3LfXhXmL6TE=
X-Received: by 2002:a25:3b04:: with SMTP id i4mr9597838yba.767.1638234579919;
 Mon, 29 Nov 2021 17:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20211129215634.gydsyfyhu6rhbbe2@meerkat.local>
In-Reply-To: <20211129215634.gydsyfyhu6rhbbe2@meerkat.local>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 30 Nov 2021 02:09:29 +0100
Message-ID: <CAKXUXMxvm9NQHK9fjtzPFEasRthTdceNLcpwpQ9oV62zpvWtZw@mail.gmail.com>
Subject: Re: PSA: generic patches@lists.linux.dev list
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 30, 2021 at 12:56 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> We have a generically named list `patches@lists.linux.dev` that can be used as
> an address for sending patches.
>
> This can be useful for a number of reasons:
>
> 1. those maintainers already using lei [1] can list patches@lists.linux.dev as
>    the mailing list address for their subsystem and receive mail sent to it
>    via lei saved searches
> 2. mail sent to this address goes to public-inbox first, so it's likely to
>    show up on lore.kernel.org very quickly, with fewest delays and omissions
> 3. you can use this address as an extra cc for mail sent to other lists that
>    are less likely to preserve the message body as-is -- when retrieving mail
>    with b4, it will give priority to the linux.dev address in the presence of
>    duplicates.
>
> Mostly, it's a dumping ground for patches. We can even use it as "THE REST"
> address in MAINTAINERS to help offload some of the traffic from vger and make
> linux-kernel@vger.kernel.org less of a firehose and more amenable to actual
> discussions.
>

I always thought that sending patches to mailing lists has the beauty
that the technical discussion and decision on the actual change is
"seamlessly" connected on the same channel and allows simple
transition between those two categories. E.g., a discussion can evolve
into a proposition of a patch within the email thread or a patch can
spin-off a wider discussion on the software architecture or policies
in the development.

The proposition of patches@lists.linux.dev dedicated for patches vs.
other mails somehow is troubling to that beauty.
Also, I would not be surprised if besides the obvious disconnect
caused by two lists and the unclear situation of which email belongs
to which category (when does a technical discussion cause a patch
proposition, or when is a patch review evolving into a policy
discussion), we end up with two mailing lists, patches and
linux-kernel, that both lists still feel like two fire hoses similarly
uncontrollable as before. Or alternatively: any good filtering that
made it manageable before with one large list, would not look
significantly simpler just because there are now two lists with an
implicit categorization on its mail content.

Just thinking out loud,

Lukas
