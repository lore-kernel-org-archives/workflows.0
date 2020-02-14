Return-Path: <SRS0=XKJj=4C=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0995BC35242
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C41302187F
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aR4ZnUlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbgBNTat (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Feb 2020 14:30:49 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54894 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387557AbgBNTat (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Feb 2020 14:30:49 -0500
Received: by mail-wm1-f68.google.com with SMTP id g1so11112235wmh.4
        for <workflows@vger.kernel.org>; Fri, 14 Feb 2020 11:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=lx7NnbarvdXYfRcKqcPC/0eJgXSU5Uu8aBdKeL4AwvE=;
        b=aR4ZnUlAteDmTfAIz5A4X0halsQhXuOCwgUkQqb/uvDTQIfKna2t62syus3UWje6+g
         5VYBSqEArtbmvcdFhewJmJmHieKJ1CNwXPa5sX+/4dYLIn+yFSSa9KGvxpbw/L2dLXb7
         oClfCmYaU2L5I30F8VpBYbBdIpmeTf+kfEvQeCTIxmFS+9PaP+BxelOJUpJOQ5BsEzDf
         BhAaWJB529vUM5xlVAVzrs88cX1KHWvvfh+I3Ptzb+lux/zPP0BHM6SptREAogQgnW6y
         8bkIK5FOFA8bybvdGndQI33JlkRYsnmIRHdh+qOrCBQ3MZp0XkNreeizuTSf4PrtupHc
         /Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=lx7NnbarvdXYfRcKqcPC/0eJgXSU5Uu8aBdKeL4AwvE=;
        b=BhciBTEoUK38yiNHXNPawGX8HNAWlNEoUIvFRvxWQc1lMTJ2EPTTMUEbmalxeMJUi7
         UlyN3YlhpP2HNylAUMOscSXX4FptRLv0M8rd05kUAF+BQKnhCpkiYLF+boIE4ACsgF+s
         ZicWxYOKQDsn5WApaUPrpmtc7oIK+4fHTLYyN34mWqntYOLL0giVl8df1zmWG9Vnxxk1
         S9+Vo7JaCVGZbfl6yS0kbRUUcYBC+zVK2pSWPMdp8h20luGVgqLrgzIogEgH7kWUZpoh
         BmEF7XiqjRj7JssYAk+7IymAgbNQDEAi877pFAaUpkR98L4yseA95/cYyQJZ1l7tmBez
         9M+A==
X-Gm-Message-State: APjAAAUmT45J9TLWPHCN1DKj8W/ris46GZ1+f/6fSkbDbMY3dP7dmbsF
        s7qqmTsH6iG3hSI5LivUvbNfe27AXWQ=
X-Google-Smtp-Source: APXvYqwkaHEnfM0aorMnV5mKHz17GITb7CL7dRpJr+Xf/nY+qw9DL9lVctjuNQkzjgeYGr8a0Zlbww==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr6200957wml.55.1581708645374;
        Fri, 14 Feb 2020 11:30:45 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id y7sm7939214wrr.56.2020.02.14.11.30.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:30:44 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
In-Reply-To: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
Date:   Fri, 14 Feb 2020 11:30:42 -0800
Message-ID: <7hwo8p9db1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> I'd like your opinion on this quick helper script I wrote that uses any 
> message-id to grab a full thread from lore.kernel.org and save it as a 
> mbox file.

This is very useful, thank you!

One question/request: Is there a way for it to only grab a subset of a
series?  e.g. Some series contain patches that might end up going
through a couple different trees (e.g. DT patches typically take a
separate path than drivers) so as a maintainer for one of the
subsystems, I might want to only get a subset of the series into an
mbox, not the whole thing.

IOW, Right now even if I pass a msgid from the middle of the series, it
finds the whole series (which is cool!), but what if I want to apply
just that single patch?  Or even better, I might want to only apply
patches 3-5 and 9 from a 10-patch series.

Is this something do-able?

Kevin
