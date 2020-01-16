Return-Path: <SRS0=6D5N=3F=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B965C33CAF
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 19:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4A9C2053B
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 19:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h1iZ48jb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgAPTkK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Jan 2020 14:40:10 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:43520 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgAPTkK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Jan 2020 14:40:10 -0500
Received: by mail-io1-f66.google.com with SMTP id n21so23245905ioo.10
        for <workflows@vger.kernel.org>; Thu, 16 Jan 2020 11:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o7W9JiW9n0YzU5WH1FK+4kmlv8NJtwYqSYQl8egNEoo=;
        b=h1iZ48jbx4Z1H6tRQTFa+EsFzhNncB7gWx9/Gj2mbqzRSgwacaFtKbAvMEum7UaEUt
         VWUCaWlXVZyXks9rnSHGDZ4lVJKvWmYdhxzICU2sOHgtRXw7k4FiOm2Voq5DE/PUDS3a
         PAOLSUXaH70c7/lPuTNmrFwhguw9P+Nd8dSG3FJMo9EeoTO3YOaR3wg9EyuCjnXQ1Hk/
         tJ3S0LHG8Epgfg9waH2YXuj7IHPois9jCebuPvPH3S7mi0DEZpUzP9a9NfeN6ydaqsto
         Qp9UpKjykRoV9owwnuKXChRsL+0LZq1In6vQrgq5aM4+E1jddfaPC/w8g359MqjQyqnt
         W3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7W9JiW9n0YzU5WH1FK+4kmlv8NJtwYqSYQl8egNEoo=;
        b=MzL60Ht7sZtrueuaR9WPaopJQ7fXcdp6D98f+65wP1oaHDQXHr/RizBGfKNuKfPMaG
         UvUNQX7dOomf00sKNkAb9u9neQxu+zrGrCUauPnmUkrkoryNu0Yx7hEumoJgvNFOjwCN
         Fw29S36jlgUItXPWasED/pS+PfMAHYo2VDi5tLljKsXOsv2RNANxizvgHj+X8wVzUg8E
         PrVdDia3XpcJ5hZE1Pcnm9jwuux/tpRGBO4wdrAHJVD0OFYeTrkMrKb+pdaNZAhycNn1
         xnA4IE/TP+p4QLS70ob1U9ywN11iJaCpEm24LwKrKvUIqkHMysWVKMfFTwwJyoQ30yP+
         tUPA==
X-Gm-Message-State: APjAAAUQjn6HPaY4j4SBCTzbuFFCpS5R9nHOprHSruWElqCKOAlCGHVt
        D2+4KXiYNib2Jj8BqJKKbvLo7a8ehQrmarVvsofyDw==
X-Google-Smtp-Source: APXvYqzpW3+3oGWzBxx02TWGJsg6FJmSqDj/1cVLEDA28OZnNqchffWAFXKqbM1I5QuY0ib6HVwRtCci/piNFdGxwyQ=
X-Received: by 2002:a5d:9c4e:: with SMTP id 14mr28762274iof.166.1579203609409;
 Thu, 16 Jan 2020 11:40:09 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com> <CABhMZUW5O3nMJFh+D0cTVt6jviAQw8eC+0Kx7_w38h+dRVTuxw@mail.gmail.com>
In-Reply-To: <CABhMZUW5O3nMJFh+D0cTVt6jviAQw8eC+0Kx7_w38h+dRVTuxw@mail.gmail.com>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 16 Jan 2020 11:39:43 -0800
Message-ID: <CAEG3pNB0an6RKZbTT=jL851QpT9WR_1JpjMv6ADpqsrr3GMXrQ@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     bjorn@helgaas.com
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jan 15, 2020 at 3:03 PM Bjorn Helgaas <bjorn.helgaas@gmail.com> wrote:
>
> On Wed, Jan 15, 2020 at 4:07 PM Michael Turquette
> <mturquette@baylibre.com> wrote:
>
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
>
> That's a really cool idea.  What do you do about the Gmail/plain text
> problem?  I know Gmail *can* sent plain-text email, but you don't have
> much control over the formatting, and I really don't like reviewing
> code in a Gmail draft.  I hate to admit it, but I'm always bouncing
> back and forth between Gmail and mutt.

My solution is to not review patches or send plain-text responses with
the Gmail web interface. I use Mutt and alot as my mailers for patch
review. I use the Gmail web interface for everything else.

Mail fetching and syncing (along with bidirection sync of Notmuch tags
and Gmail Labels) is achieved with the excellent Lieer tool:
https://github.com/gauteh/lieer

Only missing feature in that tool is to do something like fetching
only last 30 days of mail (basic feature for offlineimap and friends)
for the "flying with my laptop to Linux conference" use case. Maybe
another GSoC submission if I'm feeling greedy? ;-)

Best regards,
Mike

-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
