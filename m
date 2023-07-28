Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3986EB64DD
	for <workflows@archiver.kernel.org>; Fri, 28 Jul 2023 23:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbjG1XW4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 19:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjG1XWz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 19:22:55 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734F63AB1
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 16:22:54 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686efdeabaeso1827776b3a.3
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690586574; x=1691191374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3J02gGPlZbZHgOQ6syHZQDMbL88svEYL3WquPy69jjU=;
        b=OyOMvsiUoVcZVoxz3S3mVRqlkP5ItPBXfoVU508M21VmJ77cghHo71kcfTxpCTQr9B
         +KOdpAXL278mjK4gvNLkJMvHfGwSCGkxz2J2FM+sOO/PUx5qle6t7qqrHwT7HnwRvPri
         h9Eb9Y0/mCIbT3eADa8OM2kGwHE+NsJRA1EnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690586574; x=1691191374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J02gGPlZbZHgOQ6syHZQDMbL88svEYL3WquPy69jjU=;
        b=gpjCm1a0sBYX67bDjCP9vdX5aPQwd3KnJ5jM2pWrvKP0fx48ByqJlRDpaP2nmKYdIS
         sCkfF304GG7IkSU5ohVEeu0a/dIs/c8GHLL4xp9LlVZZwj+2ijOHyarRyQ4pyZ3P4hVw
         ukeCP5Dz/SjvBIOMtBIYwYbtASQdarOKKBGscLEUmsirWplN1gLoHx4+qKdPpMxSb9dN
         bZ3Y6PYz0lZN4Zus2G7IsjFS5HJnAoxkodL1TFltxAaXi18/zqf9gYeRupxkLY3VTMQJ
         YPUHtZgIE0IEZmlhNl9m4NsNL3ySNZDvcCUtRTXQxxEDi6l6pFYF/bxPzlaAOXsjfbF2
         qBWg==
X-Gm-Message-State: ABy/qLa0XNFIlMo4nrvJaFRBDLAO+jc1HUG4O/dFkSMBcCy4Nw4HYtJ6
        xKTu0ZozCpcuYVvYHyJz8HZdeQ==
X-Google-Smtp-Source: APBJJlGQfZLVQNgsEv0pXXb81+pMSf6XgrCMsILXZO2g0C5yTNhAizbBghrn9UMk6Jj4XjQAIKBtQw==
X-Received: by 2002:a05:6a00:138f:b0:686:9385:4644 with SMTP id t15-20020a056a00138f00b0068693854644mr3518683pfg.2.1690586573930;
        Fri, 28 Jul 2023 16:22:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a10-20020a62bd0a000000b005d22639b577sm3615689pff.165.2023.07.28.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 16:22:53 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:22:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Docs/process/changes: Consolidate NFS-utils update
 links
Message-ID: <202307281622.CF15DDB@keescook>
References: <20230728211616.59550-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728211616.59550-1-sj@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jul 28, 2023 at 09:16:15PM +0000, SeongJae Park wrote:
> Two update links for NFS-utils are in two duplicate sessions.
> Consolidate.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
