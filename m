Return-Path: <SRS0=GKgx=4F=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F12AC34021
	for <workflows@archiver.kernel.org>; Mon, 17 Feb 2020 14:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AF172072C
	for <workflows@archiver.kernel.org>; Mon, 17 Feb 2020 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581949836;
	bh=65alT5eff4ZLtwjqIV+kC9TINfoawVQAfJfxSZnHBOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BtMHCfEe1pd8fRfBAbZkaNxvDIKcu3W14a88Zwga89DsgzNLoYA4FVzd2iIxfKCO6
	 PBY0CAdIIR4z947rhbSQqeiaSpAFxS8tFH387SR+BO3QaDl/pc0PkuZ7noaMyq6d/y
	 nrQLAuXfH6H5QfP4YXvWIHAPy+GqA714hUZafW2Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgBQOag (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 17 Feb 2020 09:30:36 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:43179 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgBQOaf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 17 Feb 2020 09:30:35 -0500
Received: by mail-wr1-f44.google.com with SMTP id r11so19941199wrq.10
        for <workflows@vger.kernel.org>; Mon, 17 Feb 2020 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=UUrrxsJUe2iedqBT4jze+rTZXEwxNh0UAMijoOrPizQ=;
        b=I9m8iwPPwFDYqxOJ9sosp+ZQeIEJBjHlLkObWzRYjx0roqLRcXIjZoF9pXDZ0IIYdY
         KJXqm0PPoWhT/j/DnwuqXbjLmSLxokVWN1nMEX2XqMlwDoli8IptG+fPnBSPo8EIiRLO
         DOkhJu4UiOb7AvzwlErixb8gYJNg16y6mzm9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=UUrrxsJUe2iedqBT4jze+rTZXEwxNh0UAMijoOrPizQ=;
        b=IN1iltURwGEtj/61/IqdCQrvEPcRsE4qkyxpmToNx1WXaDpghPRu9X6R6ijNazbjAF
         nWuAXqS+ul/jO+OauFJP24MzcdfkkFJ7MgK+/xXApk5IDth7EpNddMlzmcSG7mhOrNyn
         var5yv60YXdMCvAyWjqumHXPVzaDQc1gDIp/JvPzQZ6KbJbynain07JOt+YGqUb1W3p/
         er5k52gYsV5dB51GsLwfAKiofuqwVM6RQxpHOL7FQyzh2hurhdsWNLjk8Wic1e/c0yhS
         0euRnFWVgwkTZN19qbPC3Bs9njRXA0ZXlxbd3BjA5JN5v6Do4KHyJF5giIkI0AQEIB1k
         wbLw==
X-Gm-Message-State: APjAAAXMyzH+Ljh0vexr1WTtAhwRM7pqP2sAMMHyDfb7Ht9OOJRQJkXH
        4dfSft2H6K/5paDKBSyKH14tlw==
X-Google-Smtp-Source: APXvYqwDMNk1QsZ+sJZK4G5Jf3vq4r32Q3oV7RmX0U9H7u/0zgJekRU1ETPOzEzzh3tLRzxbER9hRQ==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr22044146wra.8.1581949833680;
        Mon, 17 Feb 2020 06:30:33 -0800 (PST)
Received: from chatter.i7.local (tor-exit-10.zbau.f3netze.de. [185.220.100.249])
        by smtp.gmail.com with ESMTPSA id b67sm788157wmc.38.2020.02.17.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 06:30:32 -0800 (PST)
Date:   Mon, 17 Feb 2020 09:30:28 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
Message-ID: <20200217143028.zpyfgb4inznklpgn@chatter.i7.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com>
 <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
 <7hftfcaow6.fsf@baylibre.com>
 <CAMuHMdU4B8JRnyuPmJ5jKryJj580OQnFYWXo8FXpwdFe7wnvxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4B8JRnyuPmJ5jKryJj580OQnFYWXo8FXpwdFe7wnvxg@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Feb 17, 2020 at 11:52:55AM +0100, Geert Uytterhoeven wrote:
> BTW, I found another issue: 20200118124856.GA3421@nishad produces
> a backtrace when using the "-a" option.

Geert:

I can't replicate that. Can you please make sure that you have the 
latest version from 
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/get-lore-mbox.py 
?

If you still see the backtrace, please run with -d and send me the 
entire output, along with your OS/python version.

-K
