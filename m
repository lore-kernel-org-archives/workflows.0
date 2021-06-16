Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6071C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B05061410
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhFPSlR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhFPSlQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 14:41:16 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CDAC061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:39:09 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id q21so4410395ybg.8
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r+bISz8wKvIAvassrhXoUQ11Pf56YcA53hsy6YDK6pM=;
        b=nnEc4KuymPG4FJ5vs27WWdUFgQsdmK8axYV1B9mIJ5mMnUcWQPgJtb1zBM2ZXYj9f+
         tHmybJdmZow9pzbjl6JSkVSGBUs9nygx+CV5KnphtHhsb0kdCQzeRFfPV8hTWHpYimNh
         lSArGEjbie3Pf0MCCmEQOCQ+dEvhexNlEh47Z4x9w24L6O24jacFUj15JFOhXziUWxQR
         J4MYZrjrtstxcZUJr8CZxrRrz3L19FgIZ3VaKz+t39QaRDW41PJWsbc4yoyFpV5IfZs6
         gzu1tJVEcyMmILWg2rWym9EtKnUW1XU9P/VBX4HuS4a1vAie8TSAjp545cuHfr27pvVv
         2rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r+bISz8wKvIAvassrhXoUQ11Pf56YcA53hsy6YDK6pM=;
        b=djxkv58kBJOzJjDt7v3Wmsg1jOBC/N7OMn/PCbW9KQKAnuERE9DJoJ5V5bggapagNw
         G8lE0aMnHrNP95aJf90Pcyiqg3o3O2CnDk4exwOb4mG1uLW1CS1x0O2AWVmPumTEg1G0
         saFfcQbheRdiz/nEvBM+u67JpppUwKPgc08kYJd4ElcwmG+ZNwhEynlKamjcARWWZY6f
         6aSsqqKoAD4yJnIO/FRyYBHKsJiNRgoieIyKNLb7RWXmzT5T2YkgT5osRVYVvLLAAYQQ
         JBj0qao1HM316NWP/Q1dHy5dZpb7RRjw+Rlrkw77dyiKdbljnJtrr6LqS4YQzwvbDpDd
         Bmeg==
X-Gm-Message-State: AOAM533Q7gJzbXS8K+6yO/y9EMMErF9QL2yZmGZso02y/riOAcCBN8uE
        0FPtMlWePV/cEF5Z9QPLy8NOJLJZUkUv0e4hlAzQlHZYQfbQrhx2
X-Google-Smtp-Source: ABdhPJwjGjEbQXz28ED3QJVFRyR5RYj3K0DUea+OEfasAt13Eyk1xbK+3cJcEjyWQq5EyztjOKYEoOam7X1yShPcFVw=
X-Received: by 2002:a5b:892:: with SMTP id e18mr668795ybq.22.1623868748778;
 Wed, 16 Jun 2021 11:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CANiq72=qmGRTUYzXs_FP0Y2_pJOm=5O7bSTBwXawH29oTApuuw@mail.gmail.com>
 <20210616182252.flsdrkjuw2etwcud@nitro.local>
In-Reply-To: <20210616182252.flsdrkjuw2etwcud@nitro.local>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 16 Jun 2021 20:38:57 +0200
Message-ID: <CANiq72=q1V4GDuhFD=wRoQ8eN2kPxjiVg5Dg+YWzNeTc81iZcA@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 8:22 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> That's pretty cool, but I'm opposed to this on theological grounds. :)
> I think there's intrinsic value to development happening outside of any
> proprietary environments, especially if this becomes cornerstone to how a
> subsystem is maintained.

GitHub being proprietary does not really matter -- we can migrate to
any other similar service quite easily (even a kernel.org-hosted one!,
e.g. a hosted GitLab instance).

> I'm not saying Github is going to go away any time, but on the other hand we
> just watched Freenode completely implode within the span of 3 weeks, so I'm
> extra wary of introducing any single points of value into the development
> workflow. If my pr bot goes away, it'll at most reduce the convenience of the
> submission process, but not hobble it in any way, so I intend to just treat
> Github as a developer frontend tool.

Sure -- that is why the bot does not depend on any "advanced" or
GitHub-specific feature: currently it only needs to read
commits/PR/messages and post messages (i.e. the same as your bot),
which is basic functionality that any GitHub/GitLab/...-like service
must provide.

Cheers,
Miguel
