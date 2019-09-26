Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4355EC432C2
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 10:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20EBD222C3
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 10:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfIZKSa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 06:18:30 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39230 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfIZKSa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 06:18:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id s22so1500803otr.6
        for <workflows@vger.kernel.org>; Thu, 26 Sep 2019 03:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ja2VZ2PuU7WTLHAY7gNjX/qyKPpABVflpP3tcc1+5VE=;
        b=WEru9FKJuYV/RmxfgHKzN5f/Q0ywCdJtbxZzdJx/OmK3Z0iR3Zpd69ubusGEhZZ1D+
         ym54lgISIDIPEZ455K0yAjc5sNm5IMEvhDJbyYPHT9856gfvEgDDiknZHun/ZBYDwwGY
         oGyICGpn6mLkKZ0Sj09L9jFHLb8XbPjZXaQyryQsrEjXmhVIljG/vkWprEwiERtRE5p5
         LkZdUzIfxam+C0Yc2CYaUw371H+ErF0LcvjrXI6Of5FlnTcQ+F48dYZeecABKZlOYosq
         z7I5NgTTkh6ZqKSaPLFFq3gYTPgeKme59yeXLmoaiDEbgjN6aAR6vDU8/w05JPAjAszA
         rkuw==
X-Gm-Message-State: APjAAAXf9PwbVgKzZJdzRSNRPpiihNOiS9kS6EIw9lpd2JoLS9c9Rsqx
        fRbxA6tRSZabHePj7bSTcSu9QTinwWu1Lo2j8jE=
X-Google-Smtp-Source: APXvYqxhDTLqwH/ax/1TUggIVCsoQ6+BPqPZwo9FJKZPfjeep5ExEOAImdJNTzFAMCSAqzIt2AANBxLVCRWIscGfHzE=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr2030824oti.39.1569493109654;
 Thu, 26 Sep 2019 03:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu>
In-Reply-To: <20190923162001.GD6005@mit.edu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 12:18:18 +0200
Message-ID: <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com>
Subject: Re: Kernel development collaboration platform wish list
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
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

On Wed, Sep 25, 2019 at 6:19 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> One of the things I'd like to add as a strong desire is the ability to
> review patches via web if that's what users would like to do.  There
> are some real benefits for web-based review.  It means that if you
> need to see greater context, it's relatively easy to do this.  It also
> is convenient to be able to see the conversation for a particular hunk
> of code right alongside the code.
>
> It's clear that whatever we do, it needs to be compatible with e-mail.
> That's very clear.  But it would be useful if we can support both the
> e-mail and web-based review.  There have some prototypes that have
> been floated which shows that it is at least possible; perhaps
> imperfectly, but something which provides a bidrectional gateway
> between those who perfer to use e-mail and those that prefer to use a
> web-based UI would be able to do it.
>
> There will be many potential kernel contributors who will be used to
> web-based UI's such as those that are available on github.  So while
> remaining e-mail compatible, having some way of allow as many
> operations to be done via web interfaces might help us get some newer
> developers who are more comfortable to living on the web than some of
> us more senior developers who remember when "gopher" was a text-based
> search engine, and not a mascot for the Go programming langauge.  :-)

And if it's done right, it may solve (or make it harder to show) other
bad review
behavior, like:
  - Top posting review comments,
  - Quoting a 2000-line patch when commenting on a single line deep down.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
