Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4D1EB64D7
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 18:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjF3SGQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 14:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjF3SGQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 14:06:16 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF79E5C
        for <workflows@vger.kernel.org>; Fri, 30 Jun 2023 11:06:15 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b809354a15so11258825ad.1
        for <workflows@vger.kernel.org>; Fri, 30 Jun 2023 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688148375; x=1690740375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+Zwnu8YZsTbVSctXjlJYt17SpvJ078+AGccbtI4d54=;
        b=BbXV8tLJrOuUhPSZROFhKIGFVqp7ZpQZxlbBxD03n1lQgs3Ac+vniY2JWFxHZGOfOU
         glrErFB8CXeeo0BEtzG6BwonHqOhmvbAqsrh1JX7l8ODxsxpawXhyDYNSiCvLqlqdlOL
         AlciWF71dQS2PfgwY1tv3d/q9N2+yVRgZJdKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688148375; x=1690740375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+Zwnu8YZsTbVSctXjlJYt17SpvJ078+AGccbtI4d54=;
        b=gZEsVJ+f5/doeVWgiGroKDqy5qw3IJ1teH3D/HlsnmwRnYE+zEOZVNktsO+tBSJm7Y
         hLom+Qb3hOHZylR7Zk/uaDVzbpnfIAdHQ+CBrP151O01k996JSDQPqGiCLjVGgUJrbgs
         JdqsLtkxEbDMxBBRJM4hGbl12v9J18kc8+mHIR0miBMRNO5Obs0pM5fRfs+P9+BSM7IT
         /6rePNYrFA6ICqHEqv4H+N7Ifc4XfjOuqncavgUkKMVhPV3xh2ZXIWYwTelCrLdbvPhy
         WKFIDNdalteA826wLkXZ7GR1dpk/n4Zr68Uv6clY8z14oqHb+C2yo5IxBCA7ja+F1TC6
         CKKw==
X-Gm-Message-State: ABy/qLYUaSO9HmqimgHXugs5srJtlmXfUx6ZeTo9jJ6gIxmbz9LYSrE2
        zmbHlH+bpY0QhP6R/IWDlxDIUg==
X-Google-Smtp-Source: APBJJlGfkK3bieBby+Fp7h33oriteVblWNMhPqRITsmGKcJi23c+9zkZY4WkOwDaAd34senvqJ4G+A==
X-Received: by 2002:a17:902:d2cd:b0:1a6:46f2:4365 with SMTP id n13-20020a170902d2cd00b001a646f24365mr2858233plc.30.1688148375020;
        Fri, 30 Jun 2023 11:06:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b001b8229942a0sm6261298plw.34.2023.06.30.11.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:06:14 -0700 (PDT)
Date:   Fri, 30 Jun 2023 11:06:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        workflows@vger.kernel.org
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches from
 MAINTAINERS
Message-ID: <202306301106.4EDE05D@keescook>
References: <20230630171550.128296-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630171550.128296-1-kuba@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jun 30, 2023 at 10:15:50AM -0700, Jakub Kicinski wrote:
> Having "how to submit patches" in MAINTAINTERS seems out of place.
> We have a whole section of documentation about it, duplication
> is harmful and a lot of the text looks really out of date.
> 
> Sections 1, 2 and 4 look really, really old and not applicable
> to the modern process.
> 
> Section 3 is obvious but also we have build bots now.
> 
> Section 5 is a bit outdated (diff -u?!). But I like the part
> about factoring out shared code, so add that to process docs.
> 
> Section 6 is unnecessary?
> 
> Section 7 is covered by more appropriate docs.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Yes please. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
