Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A482E7E62B
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 04:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjI0EVC convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjI0ETq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 00:19:46 -0400
X-Greylist: delayed 87 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Sep 2023 20:27:57 PDT
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD4220093;
        Tue, 26 Sep 2023 20:27:56 -0700 (PDT)
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay05.hostedemail.com (Postfix) with ESMTP id A374840C33;
        Wed, 27 Sep 2023 03:27:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id CD94680013;
        Wed, 27 Sep 2023 03:27:51 +0000 (UTC)
Message-ID: <036869e27fbc0ec753afb4e5ae32fa74ada8e24f.camel@perches.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: add documentation for D:
From:   Joe Perches <joe@perches.com>
To:     Justin Stitt <justinstitt@google.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Date:   Tue, 26 Sep 2023 20:27:50 -0700
In-Reply-To: <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
         <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Stat-Signature: 6jixu48iy45mg7a34myg1rmef99ddmqt
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: CD94680013
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18b783Z1iiLP/edd5cDoNxFCozwvRk2dv8=
X-HE-Tag: 1695785271-7421
X-HE-Meta: U2FsdGVkX1+g/d1nMGN5TIzaLkPILcu5cAgh/c4rbcv1Lq7fTowoL0QygPEXKIBY8YXs5JBkQpgAj/qlqNiKA/W768bZxNmM96Au/0RgscIkfgVsqHQCHuRMw49EJGTj7CANhqpq4DJ9yEu+TTtxgj4kreb1IVAXHMyQwpjEh+T5s1Z1V+bQKwoeGxb4lvcMc7WfnE1oPCAnyXzAv622oM+huY6g4pRRas9afk51i8ql/zWSrtWK6N09c/uPsQYv2Wwt71QVo4hCd+09osNrgnjHPJey3CtSEOJw14klAy14OeeOgQ+kBn5q1WdA5jp8
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2023-09-27 at 03:19 +0000, Justin Stitt wrote:
> Document what "D:" does.
> 
> This is more or less the same as what "K:" does but only works for patch
> files.

Nack.  I'd rather just add a !$file test to K: patterns.

