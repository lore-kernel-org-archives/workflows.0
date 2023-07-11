Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B25EB64DC
	for <workflows@archiver.kernel.org>; Tue, 11 Jul 2023 20:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjGKUnf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 11 Jul 2023 16:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjGKUne (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 11 Jul 2023 16:43:34 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A42E195
        for <workflows@vger.kernel.org>; Tue, 11 Jul 2023 13:43:33 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b75637076eso5406145a34.2
        for <workflows@vger.kernel.org>; Tue, 11 Jul 2023 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689108212; x=1691700212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjUdrFfcJIMkJGNGdxZJPX7vh7QvoOKA+YjjfGd0IZ8=;
        b=RYbbIOpTwNHNj8ZeTMcyXdIsmQTac3bFnM9TN91zjqc/1iXqGe1kB1+IvF4rAcPI6v
         13uL1hBfR//0LG2EWnwZ7va1bOLhwKOAXq5ttO9UXkkUe/IhLXTy7Oo/kRMkwGGs4XxX
         rH1tJJjvgom5VzijBkd4Gp9D7p9hr7DhdZbMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689108212; x=1691700212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjUdrFfcJIMkJGNGdxZJPX7vh7QvoOKA+YjjfGd0IZ8=;
        b=Qf1454yMJKycms5O89c8S4WRUXM1E39b2QeIXrq4tIVkdyJY7fhDrYRm5CYSzTQJEk
         thsr9e4w1oW7BgzwcdkhtJpES6xJRpyl6JmE7P/Fmt0BmjIRfC7M2o7F3HD+2dztGR8M
         r4KyJ+KFK6xeNRh32s3/alfi9vN022idQJAXGodNMFHAfNBGVM4cOJEjkC8L4yKlxIbX
         WmCsA7gOEYA8WBjv1U3fePo+kVIyNCgcLBTLqKvE3fKm3sIAQC8hlze7BcCpPiLhEzBE
         k1mWg7Vqshj9CPN9lK1o3MCB9vIu99SRZd3DH63ufx+X+3BgQFNq/skvs8WTPAl6VNch
         5AJg==
X-Gm-Message-State: ABy/qLa0j2ZW7qE4p6/c3bXT/sF0+E8RdF7DM8CTo2FhkNh4JoCBfJy0
        ot2e9Wv8zkEBZpUqMFgShrnlEHZy/uxMX63PU9E=
X-Google-Smtp-Source: APBJJlFmr4987jlLXbzbogCv42AY5QKpJU0kjVY3vk1WjHNHiRZcqdtpvaIXNxQHbdNJhuwDqo+2pA==
X-Received: by 2002:a9d:6497:0:b0:6b7:5430:706c with SMTP id g23-20020a9d6497000000b006b75430706cmr2357614otl.24.1689108212495;
        Tue, 11 Jul 2023 13:43:32 -0700 (PDT)
Received: from meerkat.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id 83-20020a251656000000b00be8e8772025sm627518ybw.45.2023.07.11.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:43:32 -0700 (PDT)
Date:   Tue, 11 Jul 2023 16:43:23 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Bugbot for all kernel bugs?
Message-ID: <20230711-encore-hunchback-2d103b@meerkat>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Jul 10, 2023 at 07:28:26PM +0200, Thorsten Leemhuis wrote:
> Hi Konstantin. Is there any hope that bugbot will be usable for all
> kernel bugs in bugzilla.kernel.org soon? It sounded some weeks ago like
> that wasn't too far away, that's why I wonder if we might have arrived
> at a point where this support could be enabled.

I just need to add a wrapper that would make it more convenient to run as an
actual service as opposed to in a screen session I've been using for testing
purposes. Probably a day worth of effort, plus documentation.

> Sorry for bothering you about this, but I'm getting a bit tired by all
> that tedious man-in-the-middle between reporters and developers to let
> one group know about things the other did...

So, we can't easily do "enable for all the bugs" because the bot was written
with the idea that it would be invoked per-component. Is there a bugzilla
component (and a matching mailing list) that you have in mind for the bot?

-K
