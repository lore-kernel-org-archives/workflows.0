Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB184C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E652222C0
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfIZNlk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 09:41:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33027 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfIZNlk (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 09:41:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id g25so2051403otl.0
        for <workflows@vger.kernel.org>; Thu, 26 Sep 2019 06:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8Qvb7aMErAXf8Y4LUdi6kCf542ANHmi1SPZDo6kqEA=;
        b=im18LrLYeqL0egCGsojM8F7cxcAygE0eFg2mBCRtP7LA5l6K46yNqMVqEVamj7UYWE
         6KMepVUZuVNs0yEyGC4mqs/DWir+Xtjc7oDWdN2o82ubaSpAgOGrF0zaeCTlvNF0ih74
         cPqF532kX805q8QfQtiipWsxIcw0r+qsz7nEyRVL/PpbnwV0qsfsM/ZmM8Vg9bEqPR63
         loxfmNo6cTNGv3q1/swd5eu5VAlo0TzkcUbXw2onZWpAZ/Uv8PSSEUc2V3szPvqf3hXu
         eLIDRZjmyATlLXU5FIIbLC+AJ04aHzny88LvTaAHihPtHGQw/Oiip+gvFEItNMZDS7aK
         Qcrg==
X-Gm-Message-State: APjAAAWmGCN8IaNAKQTiSr/E5JbYZ0jsUtMfiWSRxoQxKEhk1sBKnMdZ
        yijGea1aIY6gu1BEqFHhpZHGDSSNnXc+jcTH0Mw=
X-Google-Smtp-Source: APXvYqyNYpqT2pH+26r9Rk3qUl6C7X0mbfPMgP5u9Cv/sH1p2ncC3QyjzK/EA37+kKirxXaqazxDLapZs0C46U5KK/w=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr447666oth.250.1569505297821;
 Thu, 26 Sep 2019 06:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu>
 <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com> <87muergq3m.fsf@intel.com>
In-Reply-To: <87muergq3m.fsf@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 15:41:26 +0200
Message-ID: <CAMuHMdU73rjaxTwxNaUY9t2LrGsSEJpX4Hz=3AJ2kwbgMYOPoA@mail.gmail.com>
Subject: Re: Kernel development collaboration platform wish list
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Jani,

On Thu, Sep 26, 2019 at 3:10 PM Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 26 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >   - Quoting a 2000-line patch when commenting on a single line deep down.
>
> I've actually become almost completely immune to that because my mail
> client collapses long quotes by default, thus highlighting the replies.

The Gmail web interface is indeed good at that... Until you want to rebuke
a review comment, and have to go digging...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
