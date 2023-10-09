Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490F4CD610E
	for <workflows@archiver.kernel.org>; Mon,  9 Oct 2023 17:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377396AbjJIRSY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 9 Oct 2023 13:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRSY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 9 Oct 2023 13:18:24 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAF09E
        for <workflows@vger.kernel.org>; Mon,  9 Oct 2023 10:18:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-694ed847889so3470579b3a.2
        for <workflows@vger.kernel.org>; Mon, 09 Oct 2023 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696871902; x=1697476702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLGHt6Q8Th/XvNk9b1wnpnqK6x+L6c4E1vcH97tDF4g=;
        b=NzXv/IHvwSfzgiJnuYb1Q5Zivv5ScCpE0Qk6BhNylLGX0diT4IKSxvuA7JwKD/2n70
         Pmad4WIpcEfpuNyg3EGM0NSl5jQ/4OYGZJsoMn2e6HLAWRwIjxsxU1JVe6PCqow5z8eZ
         xfyPpIsK7sICJmMTiofqKXCbCgcLR6P2oSooI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871902; x=1697476702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLGHt6Q8Th/XvNk9b1wnpnqK6x+L6c4E1vcH97tDF4g=;
        b=weNw8B0ds5svxNnjlwRlv1a+4xYJqBAi7XV8iAN2a1fSFNkVu7XNbioRK4DUXUNp3x
         qPsnuFoxU6aJZWcwUxyVQaQZDKAHimxuO1Yt5IQmGAMpTXuSyODV6PYdB+P67HUaZ/2S
         v7Tp7pkukLa9FqT+tCyp2F23k6ge4f65r79g1F9BeOBmBQOkiFc58Twsr0kOxJQkRDQq
         c0vi0Xj6gPykNtxKdei/n0qXQeYN9hW4MJlfY9YwlwYiy5+Z/ZVsM5hcwzTB5FPWdQ3V
         we7sKNinPhicrdfN0Q7s+p/PFjunvEPfHOiytWjWyD/MimSJF42Z8c90iymIqX8nMI87
         Oi5Q==
X-Gm-Message-State: AOJu0YxVHsKXyQstbwz8RmW/Y1dFGLjJP8sqJ9Zjm/DLHydbyoiv8W/0
        JLKaRuuv5bkJtn75QyC5yVyPGA==
X-Google-Smtp-Source: AGHT+IFwYFTVqxNmfhc2OYaSUDkCoyTLymXaYFmNx5RLf7MP7TuKSnLnGIauNGwix7285gniHNuKdg==
X-Received: by 2002:a05:6a00:b84:b0:68f:ccea:8e14 with SMTP id g4-20020a056a000b8400b0068fccea8e14mr16264330pfj.32.1696871902030;
        Mon, 09 Oct 2023 10:18:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z9-20020aa785c9000000b006926e3dc2besm6674235pfn.108.2023.10.09.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:18:21 -0700 (PDT)
Date:   Mon, 9 Oct 2023 10:18:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     pbonzini@redhat.com, seanjc@google.com, workflows@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: deprecate KVM_WERROR in favor of general WERROR
Message-ID: <202310091018.85576DC@keescook>
References: <20231006205415.3501535-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006205415.3501535-1-kuba@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 06, 2023 at 01:54:15PM -0700, Jakub Kicinski wrote:
> Setting WERROR for random subsystems make life really hard
> for subsystems which want to build-test their stuff with W=1.
> WERROR for the entire kernel now exists and can be used
> instead. W=1 people probably know how to deal with the global
> W=1 already, tracking all per-subsystem WERRORs is too much...
> 
> Link: https://lore.kernel.org/all/0da9874b6e9fcbaaa5edeb345d7e2a7c859fc818.1696271334.git.thomas.lendacky@amd.com/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Yeah, best to have just the global option.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
