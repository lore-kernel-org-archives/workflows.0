Return-Path: <SRS0=q5JR=Y6=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C41BC5DF63
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 15:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF7F721848
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 15:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="JqVkTmM+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKFPfO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 6 Nov 2019 10:35:14 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45815 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfKFPfO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 6 Nov 2019 10:35:14 -0500
Received: by mail-pg1-f193.google.com with SMTP id w11so7046630pga.12
        for <workflows@vger.kernel.org>; Wed, 06 Nov 2019 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/tXGuJrkD5/rBZB8Kuk6Sc62gfohCzzeBkNy62nakJE=;
        b=JqVkTmM+qdEq3SrAFhTHUuDQdNbcHfrUeMsAhmjaT8Ver/99IuMCyW7q4u49ilXMva
         fcL8wJoFJMLJxSkktklZmgC9DFHl+ZQyn+JbIGKCudpc2TMu8HkQN7RJEBXod89HfOOk
         S8sU53IR7rCLDfiH0sAm9J38xyBEKMOppN3Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/tXGuJrkD5/rBZB8Kuk6Sc62gfohCzzeBkNy62nakJE=;
        b=synwdGlkSaupBtGTgxW4lwoPqBrX3nadTCicf0QI/4he2ERtGKjGnBFsjYK921oNEe
         exKrGUzwk1wEt1r0+HzcejGdD4pHpp+/xRfcqbnTp3PCWOd1NHu858/FbaxYCXihGs3b
         xhtHXqhY8eC7WPVg0jzLvoS44kGLdTrOg2XahtHUKx9UdZd2wnUr2+AN4FIK+b9YOGhh
         CRbkL7eT0wCWNKAd5v2p9JDM2oZxVEKxFRKsmWXk+BmOpX2+WEALbx2DopXbAA+vs5qT
         pkSme30rlX9Rm8iUEMVXx1hVuCdanoN6aX+hQoofPQ/FLDDBEnsD+g4dFYjHCHhg3dtS
         CfWg==
X-Gm-Message-State: APjAAAVpwwi12/Ca39211HRchtZNXSrjzp4Pmb12cWR+FwB857HPIzW3
        GRvc1vGgKIy1jAibLpq3TiB0Iw==
X-Google-Smtp-Source: APXvYqwL3CvZXYkGio+scl3b6Jn8j9/e4EsNUHJAY/7x3xVmh7B8ebPeVAN31ziV/KP/SQhgAZRo3Q==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr4046569pfb.167.1573054513039;
        Wed, 06 Nov 2019 07:35:13 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id b5sm26716796pfp.149.2019.11.06.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 07:35:12 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
In-Reply-To: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
Date:   Thu, 07 Nov 2019 02:35:08 +1100
Message-ID: <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> As soon as we have a bridge from plain-text emails into the structured
> form, we can start building everything else in the structured world.
> Such bridge needs to parse new incoming emails, try to make sense out
> of them (new patch, new patch version, comment, etc) and then push the
> information in structured form. Then e.g. CIs can fetch info about

This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
at almost thirteen hundred lines, and that's with the benefit of the
Python standard library. It also regularly gets patched to handle
changes to email systems (e.g. DMARC), changes to git (git request-pull
format changed subtly in 2.14.3), the bizzare ways people send email,
and so on.

Patchwork does expose much of this as an API, for example for patches:
https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
build on that feel free. We can possibly add data to the API if that
would be helpful. (Patches are always welcome too, if you don't want to
wait an indeterminate amount of time.)

Regards,
Daniel


