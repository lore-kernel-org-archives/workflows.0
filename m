Return-Path: <SRS0=X7UR=3E=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F567C33CB1
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 04:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58ADD24655
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 04:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0QvLeoz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgAOEof (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 23:44:35 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:36225 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbgAOEof (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Jan 2020 23:44:35 -0500
Received: by mail-pl1-f179.google.com with SMTP id a6so6318868plm.3
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 20:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZBKtwJhm8OJWoEYTwkdJdCQkW6L59WU4xnIvImrw+8s=;
        b=I0QvLeoz0AmQ5SCHnbWPGCMNINPqDUwrqeaZx896K0aqepnwrrwzM9SayFDF05b2ZX
         KbXyyRX0VzEXslAJrKMqT5Fi4KkSP5SZksxNhqnOQ2+CGJMMcN9+W0hLmC8IKCg07VQ2
         TVtis7OC3WminEH5+KJKvsOJCj8xlkqEJ1nWRsl/gO0ekf75NudVyXAMvh99lJA4WHI5
         PqYk35V5ltXitxyuXBbJf2lY1OFUkt0W96fYFjJdDJuaqZ+OYkEO2gzsg00ZPz71T7FL
         aL2gEkrM/8y0ULuo703/nVR0U+mFRervcYH7lVbDvEBHfI/VWrub1wIkOa+hcr9MBzZA
         1XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZBKtwJhm8OJWoEYTwkdJdCQkW6L59WU4xnIvImrw+8s=;
        b=SpBxxqqOzd/jxQ5diRV7pjGqFmTcAwpQSdu5FzF8MwdYWW2KPuMVgL4gfbSGirb/eY
         bNmVehVYr9CjXGIqmcQkDDU0mKbL/4yPlCZ2yONCHoEOEdPHfvQ+CsEa5U8NCOOlmoGd
         LQ89L8UG8WNv/7uuhivmFgz69Cf0V/I1Er+SvWgn3HFP/C5awN1iL4HDKO3nTxlH9dZa
         XtCGe6q+hzQRHO8aAkY0Fs2b4Si9kbokXWHnzz200Hicb38nc6utpKlASDDSPKYA1swQ
         jQmerkbzc3BuzlEDtSfJ/6B00F1yu6pkCmF+RtY/27uStBQyT8lzGcec23fiSAi8emWk
         y/dA==
X-Gm-Message-State: APjAAAXjPtuNDijsVZDKSXgAXadqxkc8q6/nS6+aVPoLmhUhCYzMSQPL
        YqcgRmXlEmeL9EjkDC9f2gbM/x1qLrb5TsRM74TmqQ==
X-Google-Smtp-Source: APXvYqwOEgajyWfTl0B1phL24x7y78nQ/J3MG8TxSICQ2J3Ky++kmUkoolR9zLIG3S4W3hJq9V0SJPHEaJ9KPDpc2LY=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr33819482pjt.131.1579063474698;
 Tue, 14 Jan 2020 20:44:34 -0800 (PST)
MIME-Version: 1.0
References: <87d0bmkx1w.fsf@linux.ibm.com>
In-Reply-To: <87d0bmkx1w.fsf@linux.ibm.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 14 Jan 2020 20:44:23 -0800
Message-ID: <CAFd5g4614xziq1vTFhXYDmnMf4LVHsX6or-Sq9kH=6sDsjxUjg@mail.gmail.com>
Subject: Re: matrix.org as a replacement for IRC?
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jan 14, 2020 at 5:06 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi all,

Full disclosure: I use both Martrix and IRC.

> Was there any discussion around using matrix.org or any other
> alternative as a replacement for IRC? This should help to avoid setting
> up irc proxy to keep track of discussion when the users are not online.

I think that matrix.org is very useful. However, I wouldn't replace IRC with it.

I use Matrix's bridging functionality to basically act as a cloud IRC
client (since it's free and I only use it with IRC channels which are
public anyway), but I do mostly use a local IRC client for my day to
day.

I like the features that Matrix gives you, and I think that it
provides a web interface which is less unfamiliar to a newbie.
However, I do think for someone who knows IRC, the overhead of joining
Matrix is meaningfully higher than joining a new IRC server/channel.
Also, the features Matrix provides are not very useful if you either
have a bouncer, a cloud IRC client, or you don't care about history or
access from a mobile device.

So I definitely see Matrix vs. IRC as a tradeoff if you are living in
the all-or-nothing world, and a tradeoff that many people would
reasonably not want to make. Nevertheless, as I mentioned, it doesn't
have to be that way: just use the Matrix bridge feature and then
everyone is happy. You get to use Matrix if you want, everyone who
just wants to keep using IRC is happy too. (Also, you don't need to
ask for permission to do this either.)

Cheers
