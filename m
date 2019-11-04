Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CF1CA9EB5
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 17:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19E5120869
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 17:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfKDRlE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 12:41:04 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:37901 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfKDRlE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 4 Nov 2019 12:41:04 -0500
Received: by mail-oi1-f177.google.com with SMTP id v186so14874719oie.5
        for <workflows@vger.kernel.org>; Mon, 04 Nov 2019 09:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9Dk4C8/H68luIPgcAPO5Ke6o1o/p+dGMaq4z+03Nmk=;
        b=d44NbWTXMGA5allvpqsQdDGOnoQnbzsnwCZcKfDJ7/l/TGLXA6S/uNXPsQnKID9H2e
         BjURT5xuTPQLept+9S1rbfJIU+nl7PD1Of9jjgP2PI6aXilof1azCQDUjiwMgnJ3tv18
         hRpBDhobWzt2niMWM0DKPp4DzCpLo3TgXbf8l23pR8L/rFRNNlkaD1olZOhqo+ABQxtn
         mrg+rfDgbX/kX8S+XciERIyaLtXK1k/C7uTvkvMOLwsvADvvjUy8q9Ym5rlJH+Hxf8Gj
         yfPmSPilRwLwMGpz23DeWQptHgaZErOP09nBbkF9ZWPIPudCVyGudcmmm2YA102UmnUM
         SLCQ==
X-Gm-Message-State: APjAAAUj3C9aj/b3VGGRwDpDgmA/KmtbNx/28iMrj9OQG4RYlN/2uruu
        lXOmVIwZ3f2YBPVHHMEQNOIgLkQs4aVSldmc5FU=
X-Google-Smtp-Source: APXvYqyU2Awk9ecATtT9mZzVrn9bprMa/ocvHFJF823Zjf8ZAP+TICU0VXCQcCtPqT0t0lifCv3Yz7CMJYMn/G4SoSY=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr188420oia.131.1572889262202;
 Mon, 04 Nov 2019 09:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20191101022746.GA25491@dcvr> <20191101090456.GD2671695@kroah.com>
 <20191104131310.GE28764@mit.edu> <CACT4Y+atKXTqfjSCjzhf_P0MT+fQT-vP90nfct__BaiF2qiK0A@mail.gmail.com>
 <87sgn37l2t.fsf@intel.com>
In-Reply-To: <87sgn37l2t.fsf@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Nov 2019 18:40:51 +0100
Message-ID: <CAMuHMdXFRx6f1PqAqCxDJn4gpr4+HiHZTn3tuS=_Yq92j_Lzeg@mail.gmail.com>
Subject: Re: patch attachments still unwelcome?
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Greg KH <gregkh@linuxfoundation.org>, Eric Wong <e@80x24.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Jani,

On Mon, Nov 4, 2019 at 3:52 PM Jani Nikula <jani.nikula@intel.com> wrote:
> Typically you'd have a multipart/mixed MIME message with several parts
> of various Content-Types. In this case presumably text/plain, but
> text/x-diff is not out of the question for patches. Also seen a lot of
> application/octet-stream for logs.
>
> You can give a *hint* to the recipient MUA on how to interpret each part
> by setting Content-Disposition: attachment or inline. Bottom line,
> whether you can control that in your MUA, and whether the recipient MUA
> actually respects that is anyone's guess.
>
> For fun, this multipart message contains three parts, the one you're
> reading, and two additional parts, one of which should be inline and the
> other one an attachment.

So the Gmail web interface shows both as attachments, but can show
the contents when I click on them.
The Gmail Android app shows both as attachments, and forces me to
download the attachments to read them, using a selected app.

Ergo, no attachments is the safest.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
