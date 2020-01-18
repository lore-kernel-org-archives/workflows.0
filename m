Return-Path: <SRS0=5P68=3H=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1702BC33CB1
	for <workflows@archiver.kernel.org>; Sat, 18 Jan 2020 07:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D719B2468B
	for <workflows@archiver.kernel.org>; Sat, 18 Jan 2020 07:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2kqwlXh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgARHS4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 18 Jan 2020 02:18:56 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:40584 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgARHS4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 18 Jan 2020 02:18:56 -0500
Received: by mail-il1-f172.google.com with SMTP id c4so23226154ilo.7
        for <workflows@vger.kernel.org>; Fri, 17 Jan 2020 23:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUwnIpeEHuxfLBEE26Cp/n5Pk5qdxm+kfhS9xPdGyLI=;
        b=I2kqwlXhat5m0ShA4gL8yfn3bmOHNEOhjFE4BROEkT99ummkMqmLoJ8mcwlZtocuEq
         zd396zMbjwEXNUXYiD3BR94p7Zt7L/qDle8G4KwUykI1IA2F+tzWsJeh09poKvqAcU55
         c8U5qO1WlcEEC8FqqmYe0kN/awCqA2P5v91ul4QlETkP9irRPDQnc3cltCuex/DujAfG
         Zekzh2jOQuWWqn0kdP1/VAe8huDUO+gfFq01UjwfzexbGlnV3mwZBnkxGiqRoLY7zJtm
         cdea0iQJyYRSui6vhNlxOm+4WedfC1RjJNNuA/Z3XUA1nKOoMaAnDCIWu86F7WPIQTUo
         n70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUwnIpeEHuxfLBEE26Cp/n5Pk5qdxm+kfhS9xPdGyLI=;
        b=C3BMXoJc2/m1rpODZ71sJMd9KNtaQ9PbR7MrWcXPc410+USOPR0Rig4FjgiGPVfPef
         L/aWF3WRr97XGTYXib2w3kZGlHhq9YNZSwVWt+4L7lEFI5cAPUMknCi7ZISGRMXyJqXw
         2rgPdzKB7HRM/xIc4OAWU7z/gNR7uCbaAXqrkeJugWo9A3LGxENa3jt/lAdAZXxfS/jl
         BkFJ+sZEZeukTeqgqldb2Y1TyD4XJuaLubIxPcvh6R0jOd2F+8vNB/rwzDcpBwf/Sxlp
         OAitts9PIl6UETYOCp6vCfmK+zhwgqkHTEMuJUb2gOv8rvW/AwG5mhTgM22oB4pyXSKB
         +chQ==
X-Gm-Message-State: APjAAAUI+FXw3SS9Pu9WQVNB2cWKB9dh7r10JsqB2TK9kDX7ynJil9+I
        4ErI8vwWvZ/PSynzK0rA30Vk8I4tDf/PpD9eZdE=
X-Google-Smtp-Source: APXvYqxCgS7A0Ukvq7bOWDbkX5ZscrZOmWa+TTuhUiLP5+T6k3WWQYTMZkVfpOhuPE0v8aJDzx2tDLmEF+N9qWGTIx8=
X-Received: by 2002:a92:498b:: with SMTP id k11mr2015255ilg.221.1579331935638;
 Fri, 17 Jan 2020 23:18:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
 <CAKXUXMwa-4mc4zNfO=mTHCyiwhNYzQFA=HocaTZF0jeCZrnZ3g@mail.gmail.com> <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com>
In-Reply-To: <CAEG3pNAh-LJOYegvsjKqdd3ENiJLnkDgikdDQLGpctQcz+M04Q@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Sat, 18 Jan 2020 08:18:44 +0100
Message-ID: <CAKXUXMweFAkmi+gubcvhZQjN1bWHOghFUcpAr3_tsDk-4S0Kiw@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jan 17, 2020 at 9:38 PM Michael Turquette
<mturquette@baylibre.com> wrote:
>
> I would be interested in learning more about the duties and
> expectations of mentorship. Do you have a link? If it's not too much
> work to add to my load then consider me interested.
>

The mentor GSoC guide tells you all you need to know:

https://google.github.io/gsocguides/mentor/

Lukas
