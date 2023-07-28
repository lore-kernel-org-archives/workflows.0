Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04798EB64DD
	for <workflows@archiver.kernel.org>; Fri, 28 Jul 2023 23:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjG1XXC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 19:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbjG1XXB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 19:23:01 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9F73AB1
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 16:22:59 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so5991105ad.0
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 16:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690586579; x=1691191379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nE0WZhZhheFYU9mJRSGMx7UaIgqOMzODgIaUg2rFv5w=;
        b=VmfNhSdR5tpFf8OvIHnpoiIQqnPoDzdk7isCwfZoQAcyf1hE6J9kmcV831rIg1H+QG
         YdF/WFoJ6S/VAhKBzRnh9whnUi8Tu7+7qV7IdZNgHWCADz+2k2nEoCN8rGvehACPZAB2
         Ri/rYN6NoNKCQmYyW+hQcOPspJPehmqLpsVKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690586579; x=1691191379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE0WZhZhheFYU9mJRSGMx7UaIgqOMzODgIaUg2rFv5w=;
        b=B70ZyeD4uvOAju4KHHgXCoCXKcxdlLhBI/tgPSHH9yKdZqE7I5tqRDDPvPx8QLo994
         KDD76+b7PkDFtGMDO/U/QAu0KTOKItCAEHQeJF3IgJi8qPFbVIKoVadP6kA40g1BVA1t
         nnLcWxqMOYLDs1P3X+wAujNxqR5MpqgaXrpqo40uKgu1OWlqQIWScgfDhuAVIWFhs8vP
         T/gGpkidxyZC+T+Nj4S1cXbGlE1kYBZ2hSPoJ9C5a6uhFxdbcCr2ZBPNAYFmH78EiS5E
         mDMcigYczu+mIpqeA1X1+KNyWBEU76kd+gtnzCMyegYfRijdSrcEShY+jcGr7i80OL09
         m5fA==
X-Gm-Message-State: ABy/qLYjIpT4zt1e1nV16tje+t4h0IyvNiZIpOkwVFdOS2fmSRiOykGp
        xfa42bdPZOcRkays5nqjkiqB7Q==
X-Google-Smtp-Source: APBJJlGm9NK/8H1lG9DTKsn3Eu3AACbf4oNnruLwRCzGza0X5gnd7xYi6R3Jy0FXKwSg0pl+z9z9KQ==
X-Received: by 2002:a17:902:e88c:b0:1bb:9357:8b76 with SMTP id w12-20020a170902e88c00b001bb93578b76mr3464822plg.50.1690586579361;
        Fri, 28 Jul 2023 16:22:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b11-20020a170903228b00b001bbb7af4963sm4109419plh.68.2023.07.28.16.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 16:22:58 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:22:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Docs/process/changes: Replace http:// with https://
Message-ID: <202307281622.21D30DEEF@keescook>
References: <20230728211616.59550-1-sj@kernel.org>
 <20230728211616.59550-2-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728211616.59550-2-sj@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jul 28, 2023 at 09:16:16PM +0000, SeongJae Park wrote:
> Some links are still using 'http://'.  Replace those with 'https://'.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
