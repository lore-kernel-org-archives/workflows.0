Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCC4E81815
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 04:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjI0E3f (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjI0E2v (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 00:28:51 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BA61EB00
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:31 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59f8439a250so100993617b3.3
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695784771; x=1696389571; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyw5nVs/Tyo6Y3pNA9sKsXY24DP8vNfYIUrfBpfBjjQ=;
        b=SbWEWb8RSqkQzPAtFF9PIqFCx0EKEs0MMHwberG8U8TkdEH3JCItMEpp777vkVGF4t
         RhP+bsLXtXfOMnYO0A9o2RMksDkBuQYMUaKM+uQCX1aIm4bOf6+lbwl8TpADuY5cAr8f
         QEf3DW/54o6azSCYNNsv9jxLdXrk11vN5sFhzlp0HahP8L8dCHl15puWuRqDVDIH1TWf
         tKTvIyMxtcOincNlIOZ0CgcaRqSbjUv5bmUe33v87oxgk5fNbslVuTRDGz9KKIfQm2rI
         TeeICkKx2YxEUYtRKOGrtjXgJJLn3S7JU4bLjD7UdyVN2q3Z4/WsHXAbVDDMRLKcqky6
         bbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695784771; x=1696389571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyw5nVs/Tyo6Y3pNA9sKsXY24DP8vNfYIUrfBpfBjjQ=;
        b=KJ4sXKNZiPzcBI3atGhNPNUB+LcBEp1HSl8v2/ewHlP/ZUAhBzumskbj/wLIVS3j+T
         gc33BV/qYlVlRYgYND7nl5J0cRT5Fu6MFPk1eSXZttkXUEYXAPM2C81nlJZrdVWp1qb4
         nNM5SX6yLKc/XLH8NhB2avoiQ6NCKunkW0lqAjet5iB+rOSKXnGDz21pVXP/4Cipkl5Y
         vx/Dml0ML6qjuOEvow0m70y1uXrYsejy3jcuAfItTsg4gkysCkYCX2lhf75taLId8MtO
         Qc5fqEL4P1pSVhRky3eCmMlmNq6CmI8R56ZF0N5r9cc6CyNXSD+Gx362r3y7NPKIamod
         uJ/g==
X-Gm-Message-State: AOJu0Ywg8H7mRfqXvJh9Euvqs6iE/X1Nd1JYJStDi9vp83nTNx5HdnYp
        XbLiIVP/o994Y81jHo+/uUxI32tee+f11SF9qA==
X-Google-Smtp-Source: AGHT+IEGEo/O7VE1r16ztudiMkRH38IsAIribtuFttyLm5IVZpWkBr3/TPR/MRD256HZpEWT6hU73o87KNCZSmZBJA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:af18:0:b0:562:837:122f with SMTP
 id n24-20020a81af18000000b005620837122fmr11387ywh.9.1695784770950; Tue, 26
 Sep 2023 20:19:30 -0700 (PDT)
Date:   Wed, 27 Sep 2023 03:19:16 +0000
In-Reply-To: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
Mime-Version: 1.0
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695784766; l=2241;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=brnvnOlAf7Mom32eNFzX4SER9DsZxfr52jtHqIFd0Tc=; b=u+De8jqs3sCr0vhyWyIDMa9Ml2NRvLcM2ZDAdAeGGoVwGB79yVpiSaW5aHdTOgTI6GlvvkASV
 3K+rJxXSaWOBAhwuIIqONR0DnACTdy54dtzfFhlMF+kB/klgChvklV4
X-Mailer: b4 0.12.3
Message-ID: <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
Subject: [PATCH 3/3] get_maintainer: add patch-only pattern matching type
From:   Justin Stitt <justinstitt@google.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Add the "D:" type which behaves the same as "K:" but will only match
content present in a patch file.

To illustrate:

Imagine this entry in MAINTAINERS:

NEW REPUBLIC
M: Han Solo <hansolo@rebelalliance.co>
W: https://www.jointheresistance.org
D: \bstrncpy\b

Our maintainer, Han, will only be added to the recipients if a patch
file is passed to get_maintainer (like what b4 does):
$ ./scripts/get_maintainer.pl 0004-some-change.patch

If the above patch has a `strncpy` present in the subject, commit log or
diff then Han will be to/cc'd.

However, in the event of a file from the tree given like:
$ ./scripts/get_maintainer.pl ./lib/string.c

Han will not be noisily to/cc'd (like a K: type would in this
circumstance)

Note that folks really shouldn't be using get_maintainer on tree files
anyways [1].

[1]: https://lore.kernel.org/all/20230726151515.1650519-1-kuba@kernel.org/
---
 scripts/get_maintainer.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index e679eac96793..f290bf0948f1 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -309,6 +309,7 @@ if ( $tree && !top_of_kernel_tree($lk_path) ) {
 
 my @typevalue = ();
 my %keyword_hash;
+my %patch_keyword_hash;
 my @mfiles         = ();
 my @self_test_info = ();
 
@@ -339,6 +340,9 @@ sub read_maintainer_file {
             elsif ( $type eq "K" ) {
                 $keyword_hash{@typevalue} = $value;
             }
+            elsif ( $type eq "D" ) {
+                $patch_keyword_hash{@typevalue} = $value;
+            }
             push( @typevalue, "$type:$value" );
         }
         elsif ( !( /^\s*$/ || /^\s*\#/ ) ) {
@@ -591,6 +595,11 @@ foreach my $file (@ARGV) {
                         push( @keyword_tvi, $line );
                     }
                 }
+                foreach my $line ( keys %patch_keyword_hash ) {
+                    if ($patch_line =~ m/${patch_prefix}$patch_keyword_hash{$line}/x ) {
+                        push( @keyword_tvi, $line );
+                    }
+                }
             }
         }
         close($patch);

-- 
2.42.0.582.g8ccd20d70d-goog

