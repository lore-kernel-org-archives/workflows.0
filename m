Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33405C4BA18
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 17:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBAC72467D
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582737911;
	bh=twQPk40oBO2uXQyIK8Mj5ebPxb4ikrNEwnd2ywKc8TU=;
	h=Date:From:To:Subject:List-ID:From;
	b=RFaEBwmEz7dyCsM+rvcM7ibWXV14NY/zU/FPjwDcKcU4F0zeT1Q3jj0XEU+j717Pn
	 5UoZudMnXQ4DKqriOYqt2ReGE+egQCkjRBxCgoYWF/mQ9Csr3sZkP7yCaDzAv/jjKr
	 9suW5LE82aydW0xMNVC9tUcFc+/B7n/7Q3JxpgXQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgBZRZK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 12:25:10 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:44645 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgBZRZK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 12:25:10 -0500
Received: by mail-wr1-f42.google.com with SMTP id m16so4059993wrx.11
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=i3/aiAE6a5oLlDIIUfZOxXlSKeXtSqsBeu7MS2zPO+M=;
        b=JfwX8ThXtCgBmXdBIBVsmIGJ6gMl2jTM1nqXsXhELq8hy8/H9noiqMxhn62T0X+jt5
         SbnxU63XKn+a+IyYCy0wtNZSCRgpdIl7Hz7p27dTZRiynQHc6Ous1fNLFzz/oUInr36i
         UtTrR/FrfhQUvmRly/A8mIWN5dYkdeZgoukDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=i3/aiAE6a5oLlDIIUfZOxXlSKeXtSqsBeu7MS2zPO+M=;
        b=Se3/K3z3UweOPx3PSeKaxYySHayZEzekd83+ibjew85j533ns/lFMxNKuznWQDTFAO
         yAcdsXHpXJPy7TjSZsowZQD9XKd6EI5EY3uIYzA0CwnBVARqOsTmBGpAM50iWgWjUg9J
         8EewWvzhkIfmdrnUYN+q7zYvQ+eSlUzbeumcZ/yknEqq4LcJN090NUvBFFLtZOTYAYEt
         eH2TDmKuKZcNFkKHFhQLTBYEDPr6mCm/fYUvylRuzlprhhdkE/cSWOBwDtbTfXp9Nxv5
         +1NKqHvd8IltAM8zC9ynOK4wowRclqFAMlx/A4Y5vhcaGQvlkTPc+h+mW+hNhAIK7Cpu
         sSQA==
X-Gm-Message-State: APjAAAVqLaqz4Ku6kX2t8lRfLd3MKQppyr5h/7FV0VZ6pjrPaWBmyLcD
        vgwYvA4m4aHgxp4+v6agAEmhCkOrb1OdHw==
X-Google-Smtp-Source: APXvYqykKyfQLAEiVhqELWbUVJB3yfQuSx4XkUPEBhhU2WrbiGHN1rj/MjiaQ29Nozw78g26K1uM3Q==
X-Received: by 2002:adf:f846:: with SMTP id d6mr504237wrq.125.1582737906732;
        Wed, 26 Feb 2020 09:25:06 -0800 (PST)
Received: from chatter.i7.local (ip105.ip-51-89-200.eu. [51.89.200.105])
        by smtp.gmail.com with ESMTPSA id e1sm4076447wrt.84.2020.02.26.09.25.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 09:25:06 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:25:02 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: Patch attestation RFC + proof of concept
Message-ID: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
Mail-Followup-To: workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

I've been mulling over the idea of submitting and verifying 
cryptographic patch attestation data in a way that would be both useful 
and unobtrusive -- and I would like to propose a mechanism and a 
proof-of-concept script for your discussion.

# TL;DR

1. git clone https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git
2. cd korg-helpers
3. ./get-lore-mbox.py 20200225051307.6401-1-keescook@chromium.org -aT
4. gpg --locate-keys kees@kernel.org
5. ./attest-patches.py -c v4_20200224_keescook_chromium_org.mbx -tF

PASS | [PATCH v4 1/6] x86/elf: Add table to document READ_IMPLIES_EXEC
PASS | [PATCH v4 2/6] x86/elf: Split READ_IMPLIES_EXEC from executable GNU_STACK
PASS | [PATCH v4 3/6] x86/elf: Disable automatic READ_IMPLIES_EXEC for 64-bit address spaces
PASS | [PATCH v4 4/6] arm32/64, elf: Add tables to document READ_IMPLIES_EXEC
PASS | [PATCH v4 5/6] arm32/64, elf: Split READ_IMPLIES_EXEC from executable GNU_STACK
PASS | [PATCH v4 6/6] arm64, elf: Disable automatic READ_IMPLIES_EXEC for 64-bit address spaces
---
All patches passed attestation:
  Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)

# Preamble

PGP is already commonly used by the kernel.org community for signing and 
verifying git tags when working with pull requests. However, even though 
PGP was developed with email in mind, it is rarely used for attesting 
patches submitted via email, for a number of good reasons:

- PGP support in email clients remains poor
- inline PGP is generally disliked because it interferes with the code 
  review process (and can mess up patches due to needing to escape 
  single dashes)
- MIME-wrapped PGP frequently doesn't survive the trip due to being 
  mangled by MTAs, mailing list software, etc, and may also interfere with
  the code review process due to mime-wrapping actual patches
- delegated trust is a hard problem to solve and doesn't easily scale up 
  to the level of thousands of contributors

For this reason, PGP-based attestation of emailed patches has never 
really taken off in the kernel community (or, in fact, in most other 
communities using email-based workflows).

# Proposal

I would like to propose integrating PGP-based patch attestation into the 
tooling we are building to automate a lot of tasks performed by the 
kernel.org maintainer community. As some of you know, I've put together 
get-lore-mbox, which is a client-side tool written with the goal to make 
it easier to retrieve patches from the lore.kernel.org archival system.  
While get-lore-mbox remains a work in progress, it has been generally 
well received by the kernel development community, and its usefulness 
should only grow as it is honed to handle various corner-cases around 
this patch workflow.

I suggest that we start using lore.kernel.org as a mechanism to record 
and retrieve patch attestation data, using a special pseudo-list I set 
up for this purpose: https://lore.kernel.org/signatures/.

## Main concepts

In each patch submission there are three distinct parts of interest:

- basic patch metadata (author, title, date)
- patch description, which becomes the git commit message
- the patch itself

There is frequently other information included with the patch that is 
largely superfluous (diffstat, series versioning info, etc). It is of no 
particular interest to us because it does not become part of the git 
commit and therefore is not useful for attestation purposes.

This separation into three component parts is important, because patch 
description is routinely edited by maintainers to add various trailer 
metadata (Signed-Off-By, Acked-By, etc). Patches may also end up edited 
for typos, formatting, or ease of merging, so what ends up committed 
into git repositories by maintainers may differ from patches as sent to 
the mailing lists.

### Three hashes per patch

If you look at the contents of the patch attestation message 
(https://lore.kernel.org/signatures/202002251425.E7847687B@keescook/), 
you will notice a yaml-style formatted document with a series of three 
hashes. Let's take the first one as example:

2a02abe0-215cf3f1-2acb5798:
  i: 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
  m: 215cf3f133478917ad147a6eda1010a9c4bba1846e7dd35295e9a0081559e9b0
  p: 2acb5798c366f97501f8feacb873327bac161951ce83e90f04bbcde32e993865

The source of these hashes is the following patch:
https://lore.kernel.org/kernel-hardening/20200225051307.6401-2-keescook@chromium.org/

To split the patch into its three components we can use the following 
command:

curl -s https://lore.kernel.org/kernel-hardening/20200225051307.6401-2-keescook@chromium.org/raw \
  | git mailinfo m p > i

The three files are:

m: the commit message
p: the patch (plus superfluous surrounding content)
i: author, email, subject, date

We can immediately calculate the m hash, as it requires no munging:

$ sha256sum m
215cf3f133478917ad147a6eda1010a9c4bba1846e7dd35295e9a0081559e9b0  m

To calculate the "p" hash, we first need to remove any surrounding junk 
that isn't just the patch itself. The goal is to get the exact same 
content as produced by "git diff". If we remove all lines preceding the 
first "diff" and then everything following the content of the last hunk, 
we get the p hash:

$ vi p
$ sha256sum p
2acb5798c366f97501f8feacb873327bac161951ce83e90f04bbcde32e993865  p

We cannot use the contents of the "i" file verbatim because it includes 
the Date: header, which is modified by git-send-email. We therefore only 
hash the Author, Email, and Subject lines:

$ egrep '^(Author|Email|Subject)' i | sha256sum
2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e  -

We then take the first 8 characters of the i-m-p hash to create the
attestation-ID: 2a02abe0-215cf3f1-2acb5798.

### One attestation document per many patches

The same process is repeated for all patches in the series. The 
resulting YAML document is then PGP-signed and sent to 
signatures@kernel.org. The metadata of that message is intentionally 
kept to a minimum in order to minimize PII-sensitive data and
reduce the potential for GDPR removal requests.

Since the content of this document is extremely structured, we can 
develop a simple public-inbox filter to almost completely reduce the 
possibility of adding spam into the archive. We can also create a simple 
ingestion URL that can consume POST requests containing attestation data 
that will serve as an alternative to sending out the attestation email.

## Verification process

To perform verification, the same three hashes are generated for each 
patch being attested, along with the i{8}-m{8}-p{8} attestation-id. We 
then use that attestation-id to query the signatures archive on 
lore.kernel.org:

https://lore.kernel.org/signatures/?q=2a02abe0-215cf3f1-2acb5798

For each returned result, we perform PGP validation, and if it passes 
(meaning that we have the key in the local keyring and it is assigned 
sufficient trust), we then parse the message contents.

A patch is considered as "passing attestation" if:

- PGP validation is successful
- We find an entry with the same three hashes
- The email address in the "From:" field of the email being verified 
  matches one of the UIDs on the key used to sign the attestation 
  document

This should be sufficient to provide strong assurance that the patch and 
all significant commit metadata are identical between the system where 
attestation was generated and the system where attestation was checked.

# The attest-patches.py proof of concept

The provided proof-of-concept script is able to both create and verify 
patch attestation data. It should handle most obvious malicious 
corner-cases that I was able to think of, but it hasn't been 
scrutinized, which is why it probably shouldn't be used for real work 
until more people have a chance to weigh in on both the script and the 
overall concept.

## The submitter workflow

As I envision it, the submitter workflow would look as follows:

- the developer runs "git-format-patch"
- the developer reviews the changes and makes any last-minute edits they 
  deem necessary before submitting their work to the list/maintainer
- the developer executes "git-send-email"
- the developer runs "attest-patches -a *.patches"
- the developer sends attestation.eml to signatures@kernel.org
  (or the tool auto-POSTs it to the submission URL, as mentioned)

There can even be a fairly simple wrapper around git-send-email that 
would perform attestation as part of the "sending patches" stage.

## The reviewer workflow

The reviewer does not need to concern themselves with attestation until 
they are ready to apply the patches to their git tree. When that moment 
comes:

- the maintainer runs get-lore-mbox -aA (-A is not implemented yet)
- get-lore-mbox performs attestation before generating the am-ready mbox
- if attestation passes, get-lore-mbox adds two trailers to each patch: 
  "Attestation-by:" and "Attestation-verified:". In our example case 
  those are:
  Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)
  Attestation-verified: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
- if attestation does not pass, get-lore-mbox can provide some basic 
  explanation behind the failure before aborting:
  - attestation not found in the archive
  - the PGP key does not have sufficient trust
  - attestation exists but not all hashes pass, in which case the tool 
    can show which hashes failed verification
  - etc

If attestation is not found in the archive (e.g. the submitter didn't 
bother submitting it), the maintainer can request that it is generated 
and submitted post-fact (e.g. by rerunning "git-format-patch", or using 
their "Sent" folder, etc). 

For obvious and trivial patches, the maintainer may forego 
checking/requiring attestation entirely. That said, if a subsystem 
adopts attestation requirements, it should stick to requiring it on all 
submitted patches on the basis of principle.

# Thoughts?

Okay, what do you all think? I believe this scheme has the following 
merits:

- it is opt-in and can be adopted by individual subsystem maintainers
- it builds on top of the PGP trust framework already used extensively 
  by the kernel developers
- it doesn't litter mailing lists with non-human-readable attestation 
  junk
- it doesn't require that attestation data is created at the time when 
  patches are submitted for review; the maintainer can request that it 
  is provided at a later time when they are ready to apply the series to 
  their git tree and want attestation data for the final sanity check 
  and record-keeping
- all attestations are recorded in the public-inbox "signatures" feed 
  that can be mirrored along all other public-inbox repositories on 
  lore.kernel.org

Downsides:

- we aren't solving the problem of delegated trust, which will continue 
  to be the hardest part behind any distributed development effort

I would greatly appreciate any feedback.

Best,
-K
