Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EECDE82CB7
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 19:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjI0TAT convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 15:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI0TAS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 15:00:18 -0400
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73403DD;
        Wed, 27 Sep 2023 12:00:17 -0700 (PDT)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay10.hostedemail.com (Postfix) with ESMTP id 47168C0DA1;
        Wed, 27 Sep 2023 19:00:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 2D91F20034;
        Wed, 27 Sep 2023 19:00:12 +0000 (UTC)
Message-ID: <370b047e8b380426a250153205f703fd7a08f393.camel@perches.com>
Subject: Re: [PATCH 3/3] get_maintainer: add patch-only pattern matching type
From:   Joe Perches <joe@perches.com>
To:     Justin Stitt <justinstitt@google.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Date:   Wed, 27 Sep 2023 12:00:09 -0700
In-Reply-To: <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
         <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2D91F20034
X-Stat-Signature: fgbah7kmctnju8f8hgpmymtfrqnzsgwm
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18kq3ZGdraMKc9+Iava2gnSJXdyNpOoGvk=
X-HE-Tag: 1695841212-753963
X-HE-Meta: U2FsdGVkX1+aAdYAcxD1XJNQyOdKVCTiqiSPNgqSHYWb2QHvU0QlQ//Ym4j6Km7h1bh8jlmUGJgLf+XlGmxxDemyY6QT8kDmv8/WJtyQdXBRXmIjJ37o6slcr5IxZRlvvcdZphhs8CQFp0Mhso1BnmOOpEKVocrQGP+7hk3oYtcjmM5qiNDRnLv56FUI+lWswDc8tkC9OHzKvO+iuhEH81RZ+g7Ifg3Gwh8ZweYCh/OCQmh2HPTTaOZT2aTNk7Zt8h7bdnG7VdzhK24ZUu/2zx1BIOnm+uC+TrOJ+T48SPqIuVuA2oqVW459K3cFQ5Sy
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2023-09-27 at 03:19 +0000, Justin Stitt wrote:
> Add the "D:" type which behaves the same as "K:" but will only match
> content present in a patch file.

Likely it'd be less aggravating just to document
that K: is only for patches and add a !$file test.



