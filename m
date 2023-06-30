Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764CAEB64D7
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 18:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbjF3SSr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 14:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjF3SSj (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 14:18:39 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87743AAF
        for <workflows@vger.kernel.org>; Fri, 30 Jun 2023 11:18:38 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262ea2ff59dso1134374a91.0
        for <workflows@vger.kernel.org>; Fri, 30 Jun 2023 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149118; x=1690741118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JhOMq1HY0NT+4aYW+8kI5Q1oNJexqE5nfoCKy371/0I=;
        b=Gq+GLofs0fp24id2Rgm0KWaS7yy/ePwR72VADTUhmSlnDfIxIGhdHsbAu/WT7ihYV7
         JX9M4pvCiA8Za5u4qzsJHf/tj3Qguo0Q4zPG2hndNMm+pfxnJk2i3NIzC1I1n2e9ppP7
         xy52sibmznojoD7vpL7Mh7VecksBdNUvAznz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149118; x=1690741118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhOMq1HY0NT+4aYW+8kI5Q1oNJexqE5nfoCKy371/0I=;
        b=bYVwL5nozTneOVjl4nVYRQ/slk2/wkhb9bHpB+coVHHO/FeoyZIiAhpGUHQPOLSVRD
         NOfW9YnKTfu6KstVuws2NsfYlYvhucwZN6c6l6WPVSm4KqyTiU8IwA4SVX3UOGXrkU0Z
         qjUPlrTMJoByQIbewquhHK8FlumKt4fxor+3VT58kvbS3UEwLbOHAloLjEGw5VV7MbDP
         6LwsZQqhR7ee5m4DP9yQqWT1YmDHQxjzpB5KxoUFFNlj+hrb8xt1nzAR/CCBBHqGuSuZ
         tPzvjzFqAXjZqrhJ875HcOg0K9+HCmZqSfhsW7GyMXv6CQe+e4UllPgOlKqlLZNeMn1J
         GN3A==
X-Gm-Message-State: ABy/qLZRJpmpHG/TzWjxMOTYFsSTC/kXmKFs8FQJ/o9kd0LPpuNor5Zo
        cuowxORr/3G265aX7HL721mJIw==
X-Google-Smtp-Source: APBJJlEHl8gDvbHbgn5QL6/rpYZwgiEppjuCacYsWNgW/8HmN0RO+TJlaEelpIK+MpO8GapiFgmBcw==
X-Received: by 2002:a17:90a:ff03:b0:263:1213:df3b with SMTP id ce3-20020a17090aff0300b002631213df3bmr2628809pjb.11.1688149118116;
        Fri, 30 Jun 2023 11:18:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090a6c8f00b00260cce91d20sm11774659pjj.33.2023.06.30.11.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:18:37 -0700 (PDT)
Date:   Fri, 30 Jun 2023 11:18:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <202306301114.E199B136@keescook>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023063022-retouch-kerosene-7e4a@gregkh>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jun 30, 2023 at 09:14:21AM +0200, Greg Kroah-Hartman wrote:
> The kernel security team does NOT assign CVEs, so document that properly
> and provide the "if you want one, ask MITRE for it" response that we
> give on a weekly basis in the document, so we don't have to constantly
> say it to everyone who asks.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/process/security-bugs.rst | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index f12ac2316ce7..8b80e1eb7d79 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -79,13 +79,10 @@ not contribute to actually fixing any potential security problems.
>  CVE assignment
>  --------------
>  
> -The security team does not normally assign CVEs, nor do we require them
> -for reports or fixes, as this can needlessly complicate the process and
> -may delay the bug handling. If a reporter wishes to have a CVE identifier
> -assigned ahead of public disclosure, they will need to contact the private
> -linux-distros list, described above. When such a CVE identifier is known
> -before a patch is provided, it is desirable to mention it in the commit
> -message if the reporter agrees.
> +The security team does not assign CVEs, nor do we require them for
> +reports or fixes, as this can needlessly complicate the process and may
> +delay the bug handling.  If a reporter wishes to have a CVE identifier
> +assigned, they should contact MITRE directly.

Hmm. The language about "assigned ahead of public disclosure" was added
intentionally due to trouble we'd had with coordination when a CVE was
needed, etc. Additionally, it IS preferred to have a CVE in a patch when
it IS known ahead of time, so I think that should be kept. How about
this:


diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 82e29837d589..2f4060d49b31 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -81,13 +81,12 @@ the email Subject line with "[vs]" as described in the linux-distros wiki:
 CVE assignment
 --------------
 
-The security team does not normally assign CVEs, nor do we require them
-for reports or fixes, as this can needlessly complicate the process and
-may delay the bug handling. If a reporter wishes to have a CVE identifier
-assigned ahead of public disclosure, they will need to contact the private
-linux-distros list, described above. When such a CVE identifier is known
-before a patch is provided, it is desirable to mention it in the commit
-message if the reporter agrees.
+The security team does not assign CVEs, nor do we require them for reports
+or fixes, as this can needlessly complicate the process and may delay
+the bug handling. If a reporter wishes to have a CVE identifier assigned
+ahead of public disclosure, they will need to contact MITRE directly.
+When such a CVE identifier is known before a patch is provided, it is
+desirable to mention it in the commit message if the reporter agrees.
 
 Non-disclosure agreements
 -------------------------

-- 
Kees Cook
