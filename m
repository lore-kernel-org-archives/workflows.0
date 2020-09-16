Return-Path: <SRS0=gPPl=CZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B5DC2BB84
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 18:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E71B2083B
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600279925;
	bh=6FwS4kLSWanT3BsXCqVq9aSFZXfLhizNC82GZHuX7/A=;
	h=Date:From:To:Subject:List-ID:From;
	b=xDRyivW2L2wI/cBzRDVKZ5lSQaPuoQBNnZnLXAGhsVd6sFyf4w4gVnLbhZkjpHEuG
	 lN7T7//L4zD0IbM2pNYOKhh1hLnPqQft7nAh/tAM1tMMffv4PQVIYHo9F32R1nqfUA
	 2SiPNKVZt+2Y7avwedpiC6y0IcRzUcIShG+8fbvI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgIPSMC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgIPSLz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Sep 2020 14:11:55 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D76AC06174A
        for <workflows@vger.kernel.org>; Wed, 16 Sep 2020 11:11:54 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id 16so9178990qkf.4
        for <workflows@vger.kernel.org>; Wed, 16 Sep 2020 11:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=r/MmK60tucuNt8hNMnhpRAYNsByNHEEXQqMRAwR2lXQ=;
        b=NzLSSM0JS79vZ/pRqGefBIC5mz1evvWsmDXeZXMnH2GpFo2860OCjbuJ1SPh0aMYbR
         uNsDme2SqS9FaZ8nAVXXmhU9G8EakwKq3anDcen6hH8ZpRJEDz/Ad9XrSmOaRGXOMkbM
         g7Aw9JrDbKg+eYTY2B63oQmXGebsLQU5/eQuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=r/MmK60tucuNt8hNMnhpRAYNsByNHEEXQqMRAwR2lXQ=;
        b=g+b44ec60/sx0h9a7F3+OzJzroIM9z3HRDqMQcbVTIVgmhShUrH7fZynBpMVtvhFiv
         ds4Mb31u+nbIRi/Qn8MJYw5W1G4AMz8WrHQdAomcufqGBOAU1EqY0GLq5Zkt5JqD1qpr
         j/vnf2hsavCGKncCjUqR/JrYZAFeMbUZrUIlLat5dWY64zKWbdXKo8WgKAkmCL3OjmrR
         blYENpFs2ulCWIoLMwKPhiB0hrCWFUXeUCOiYvfz5DmQY5V+CTdewqxT9qC+WUB0ObQn
         Dx5oeNSlagnw3qUGe3UFC02H1aHoxVt0YpSo7BNacTjDU8nTWyZkNkQ5RT6Y20K9xY/b
         bz2g==
X-Gm-Message-State: AOAM531yt40tsDInUdMLdROxhrAVn9XU5RGwEiimdVmdT3zWZ6UZokYX
        DYnB13C8v5pmurROy8ey6uNf8oTL7qIpm4QD
X-Google-Smtp-Source: ABdhPJwqRRopskEI0lI+GKbP5lcMDx+rZ1NQAXZq61gJOlLqjDQuR15cTge0KR5gPEexLm71DxqaWg==
X-Received: by 2002:a37:9f86:: with SMTP id i128mr24737950qke.475.1600279910765;
        Wed, 16 Sep 2020 11:11:50 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id o35sm7881619qte.23.2020.09.16.11.11.49
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 11:11:49 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:11:47 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: Patch attestation, attempt #2
Message-ID: <20200916181147.yt2dieagakfdkagj@chatter.i7.local>
Mail-Followup-To: workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello, all:

In continuation of my patch attestation work, I would like to submit for 
your consideration an alternative implementation that is both simpler 
and more likely to find wider adoption due to introduction of
domain-based attestation that is similar to DKIM in nature. While I 
consider domain-based attestation less robust than individual developer 
attestation, it has the upside of providing an easy way to make all 
patches coming from entire domains tamper-evident, once they receive the 
in-header signature. In other words, a patch coming from 
developer@kernel.org can be verified to have been mailed via kernel.org 
and not altered since leaving the kernel.org SMTP server.

Domain-level attestation works alongside developer-based attestation, 
and can also be done via email headers. It can be done either with PGP, 
or with individual ED25519 keys, distributed via web key directories.

This proposal comes with a proof-of-concept repository implementing all 
the signing and verification functionality. It can be cloned from the 
following address:

https://git.kernel.org/pub/scm/linux/kernel/git/mricon/patch-attestation-poc.git

Below is the proposal itself, taken from README.rst. All examples 
mentioned in it can be replicated using the POC repository.

------

Header-Based Patch Attestation
==============================
Author: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Status: Alpha, soliciting comments

Preamble
--------
Projects participating in decentralized development continue to use
RFC-2822 (email) formatted messages for code submissions and review.
This remains the only widely accepted mechanism for code collaboration
that does not rely on centralized infrastructure maintained by a single
entity, which necessarily introduces a single point of dependency and
a single point of failure.

RFC-2822 formatted messages can be delivered via a variety of means. To
name a few of the more common ones:

  - email
  - usenet
  - aggregated archives (e.g. public-inbox)

Among these, email remains the most widely used transport mechanism for
RFC-2822 messages, most commonly delivered via subscription-based
services (mailing lists).

Email and end-to-end attestation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
There are two commonly used standards for cryptographic email
attestation: PGP and S/MIME. When it comes to patches sent via email,
there are significant drawbacks to both:

  - Mailing list software may modify email body contents to add
    subscription information footers, causing message attestation to
    fail.
  - Attestation via detached MIME signatures may not be preserved by
    mailing list software that aggressively quarantines attachments.
  - Inline PGP attestation generally frustrates developers working with
    patches due to extra surrounding content and the escaping it
    performs for strings containing dashes at the start of the line for
    canonicalization purposes.
  - Only the body of the message is attested, leaving metadata such as
    "From", "Subject", and "Date" open to tampering. Git uses this
    metadata to formulate git commits, so leaving them unattested is
    suboptimal (they can be duplicated into the body of the message,
    but git format-patch will not do this by default).
  - PGP key distribution and trust delegation remains a difficult
    problem to solve. Even if PGP attestation is available, the
    developer on the receiving end of the patches may not make any use
    of it due to not having the sender's key in their keyring.
  - S/MIME certificates are increasingly difficult to obtain for
    developers not working in corporate environments. At the time of
    writing, only two commercial CAs continue to provide this service --
    and only one does it for free.

For these reasons, end-to-end attestation is rarely used in communities
that continue to use email as their main conduit for code submissions
and review.

Email and domain-level attestation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Since unsolicited emails (SPAM) frequently forge headers in order to
appear to be coming from trusted sources, most major service providers
have adopted DKIM (RFC-6376) to provide cryptographic attestation for
header and body contents. A message that originates from gmail.com will
contain a "DKIM-Signature" header that attests the contents of the
following headers (among others):

  - from
  - date
  - message-id
  - subject

The "DKIM-Signature" header also includes a hash of the message body
(bh=) that is included in the final verification hash. When a DKIM
signature is successfully verified using a public key that is published
via gmail.com DNS records, this provides a degree of assurance that the
email message has not been modified since leaving gmail.com
infrastructure.

Just as PGP and S/MIME attestation, this has important problems when it
comes to patches sent via mailing lists:

  - If the "sender" header is included in the attestation, the DKIM
    signature will no longer verify due to mailing lists necessarily
    rewriting it for bounce handling.
  - ML software commonly modifies the subject header in order to insert
    list identification (e.g. ``[some-topic]``). Since the "subject"
    header is almost always included into the list of headers attested
    by DKIM, this causes DKIM signatures to fail verification.
  - ML software also routinely modifies the message body for the
    purposes of stripping attachments or inserting list subscription
    metadata. Since the bh= hash is included in the final signature
    hash, this results in a failed DKIM signature check.

Even if all of the above does not apply and the DKIM signature is
successfully verified, body canonicalization routines mandated by the
DKIM RFC may result in a false-positive successful attestation for
patches. The "relaxed" canonicalization instructs that all consecutive
whitespace is collapsed, so patches for languages like Python or GNU
Make where whitespace is syntactically significant may have different
code result in the same hash.

DKIM works well enough for end-to-end email attestation, but has
important drawbacks for domain-level attestation of patches, especially
when they are delivered via mailing lists.

Proposal
--------
The goal of this document is to propose a scheme that would provide
cryptographic attestation for all message contents necessary for trusted
distributed code collaboration. It draws on the success of the DKIM
standard in order to adapt (and adopt) it for this purpose.

Anatomy of an email patch
~~~~~~~~~~~~~~~~~~~~~~~~~
A patch submitted via an RFC-2822 formatted message consists of the
following three significant parts:

  - *metadata*, which includes the Author, Email, Subject, and Date of
    the submission
  - *commit message*, which describes what the change is supposed to
    accomplish
  - *diff content*, which is structured data that should be applied
    to the codebase in order to implement the changes proposed

Patch submissions also routinely provide additional content that may
have significance to the author or to the reviewer, but is not preserved
in the codebase after patches are applied, such as:

  - information describing changes between revisions
  - statistics about what files are changed (diffstat)
  - structured data indicating tree dependencies (base-commit)
  - author's signature and software version info
  - mailing list subscription metadata

Our goal is to provide attestation for the significant parts and ignore
the parts that are not preserved after code is committed to a git
repository.

Three hashes per patch
~~~~~~~~~~~~~~~~~~~~~~
Instead of creating a single attestation hash, we create a separate hash
for each meaningful part of the patch submission:

  - i: patch metadata
  - m: commit message
  - p: diff content

This allows the person performing verification to identify which part of
the submission has been altered since being signed. A change to a commit
message may be explained by the addition of a ``Signed-off-by`` (or
similar) trailer, so the developer performing the review may ignore a
failure in the "m" hash if the other two hashes are passing.

Similarly, a patch that goes through a chain of maintainers will
necessarily have its commit message modified by the inclusion of various
provenance trailers. Having a separate hash for the patch content and
patch metadata provides a way to track whether or not any of the
submaintainers made changes to the patch code, or just to the commit
message, as is generally expected.

To generate the three parts, we rely on the ``git mailinfo`` command,
that does most of what we need::

    git mailinfo m p > i < email.msg

The above command will produce three files that closely match what we
are looking for, but require a bit of extra processing to remove content
that is likely to be altered in SMTP transmission.

To get the "m" hash, we take the "m" file as-is::

    sha256sum m

To get the "i" hash, we remove the "Date" header from the output,
because it can be modified by git during format-patch or send-email
stages (or, infrequently, by SMTP relays). We only take the "Author",
"Email", and "Subject" headers::

    egrep '^(Author|Email|Subject)' i | sha256sum

The "p" file requires most work, as it contains data from the "below the
cut" portion of the commit message (usually, diffstat and revision
information), plus trailing content such as signatures or mailing list
subscription info. All of this is stripped away to leave just the diff
content. Unfortunately, there is no way to do it with git itself, so we
use manual parsing of the diff structure to perform this operation.

Why not use git patch-id?
~~~~~~~~~~~~~~~~~~~~~~~~~
Git provides a command to generate a "patch-id" that can be used to
quickly identify similar patches. To generate the patch-id hash, git
performs several canonicalization routines that make this hash
unsuitable for attestation purposes:

  - it collapses all repeating whitespace
  - it removes all line numbers from diff contents

It is possible for a malicious actor to create two patches that generate
identical patch-id hashes but have drastically different results when
applied to the codebase. For more info, see discussion here:

  - https://lore.kernel.org/git/20200210164115.x4gciujyjisivfgi@chatter.i7.local/

X-Patch-Hashes header
~~~~~~~~~~~~~~~~~~~~~
After the i, m, p hashes are generated, we insert them into the email
message as a separate header. You can use the proof-of-concept code
included to generate one yourself::

    $ ./main.py hashes-hdr
    Using emails/unsigned.eml as message source
    --- HEADER STARTS ---
    X-Patch-Hashes: v=1; h=sha256; i=pkD5Pg8+cndZAzQQzo3RBSOOUzZM3GYWxiFIKFGIKe0=;
     m=yW4TvC/DGWCUJTa11Aw1b/2ZAXobsLD45aLA/440yQI=;
     p=iJdYN6+isP/3HmQaf1IiG7OfA1vzRxXlPGZtvecS484=

Running POC code
~~~~~~~~~~~~~~~~
The POC code is written in Python and requires an extra set of libraries
in order to work. To get going, please do the following::

    $ python3 -mvenv .venv
    $ source .venv/bin/activate
    $ pip install --upgrade pip
    $ pip install -r requirements.txt


Domain-level attestation
------------------------
Once the X-Patch-Hashes header is generated and inserted into the email,
it will need to be signed in order to be useful for attestation
purposes. Adding domain-level signatures during SMTP processing is the
simplest way to accomplish this, as it would allow entire companies to
automatically attest all patches sent out via their infrastructure.

This can be easily done by introducing a patch-attestation milter that
would automatically analyze body contents and generate the
X-Patch-Hashes header if it finds that the message contains a patch
(unless this header is already present). This milter can then either
create its own cryptographic signature or let the usual DKIM-signing
infrastructure create the necessary attestation.

Using vanilla DKIM
~~~~~~~~~~~~~~~~~~
Vanilla DKIM is well-suited for this purpose, as it was specifically
created to sign email headers. The following changes will need to be
made to the configuration for it to be useful:

  - add "x-patch-hashes" to the list of signed headers
  - ensure that "sender" is not included
  - potentially, exclude "subject" from the list of signed headers, in
    order to hedge against mailing lists that add ``[topic]`` to all
    email subjects

Here's how it looks with the POC command, using the bundled rsa.key::

    $ ./main.py sign-dkim
    Signing: plain DKIM
    Using emails/unsigned.eml as message source
    Using rsa.key to sign
    --- MESSAGE STARTS ---
    [...]
    X-Patch-Hashes: v=1; h=sha256; i=pkD5Pg8+cndZAzQQzo3RBSOOUzZM3GYWxiFIKFGIKe0=;
     m=yW4TvC/DGWCUJTa11Aw1b/2ZAXobsLD45aLA/440yQI=;
     p=iJdYN6+isP/3HmQaf1IiG7OfA1vzRxXlPGZtvecS484=
    DKIM-Signature:  v=1; a=rsa-sha256; c=relaxed/simple; d=example.org;
     i=@example.org; q=dns/txt; s=patches; t=1600264001; h=from : date :
     x-patch-hashes; bh=g2Sv1ZR+jIrWukzdXbqb+aeiqyFQOBLDQY6z0BBnGg4=;
     b=pphhMzvqehfxDDLx/OqjbrP6HnMjhlklrQacWqwf5bpZ3cVZ00z5D+BcwpzsKnpQF7c7A
     2FmO6Mtjtn/lVRwppIF+tlph46sLE9XfdS+60X6Bzzxu1u/l0uieQ+cIT3DjUuejfxVpvIE
     Zd4oAeVHD/OWRTJrWGYzrK3e+9UpIZJnxRkJLNj9OKOCwZDiGobM6+NusTWduqjYLRlMXXt
     EvRbs8QXsTkoTttngM5DwSFRXC7zYSprKxbL6i/DdE+GM+iN2UQk10lpVfhYXtDBoKX1/vX
     CXb77/X1ug1/ktfYU1xEDUU/NrovqnAfcJHCAL2lHomznoi/IYBC1qfR5t2w==
    [...]

Note, that the b= value will be different for you since the timestamp is
included into the hashed content and will be different each time the
code runs.

This header was created by a generic DKIM implementation (dkimpy),
commonly used in production via the popular dkimpy-milter daemon.

This POC also includes a few example emails signed by the kernel.org DKIM
key. You can run the POC verification yourself::

    $ ./main.py -m emails/korg-signed-dkim.eml verify
    Using emails/korg-signed-dkim.eml as message source
    Verifying: Plain DKIM
    DNS-lookup: default._domainkey.kernel.org.
    PASS : identity and domain match From header
    PASS : time drift between Date and t (2 days, 23:24:18)
    PASS : DKIM signature for d=kernel.org, s=default
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

As you can see, the verification steps will check several things:

  - that the DKIM signature passes verification (this is done as
    dictated by the RFC -- by normalizing and concatenating all signed
    headers, plus the DKIM-signature header itself, minus the signature
    content following b=)
  - that the x-patch-hashes header is included in the content attested
    by DKIM
  - that the domain (d=) and identity (i=) values match what is in the
    From: field of the email message
  - that time drift between the Date header and the timestamp of the
    signature is reasonable
  - that all patch hashes that we generate match the hashes in the
    signed header

Note, that this check specifically excludes verifying the body hash
(bh=) value, for the reasons described in the previous section
concerning DKIM drawbacks. Also, since we excluded "subject" from the
list of signed headers, the verification will succeed even with usual
mailman-induced changes to the email content::

    $ ./main.py -m emails/korg-signed-dkim-with-ml-junk.eml verify
    Using emails/korg-signed-dkim-with-ml-junk.eml as message source
    Verifying: Plain DKIM
    DNS-lookup: default._domainkey.kernel.org.
    PASS : identity and domain match From header
    PASS : time drift between Date and t (2 days, 23:24:18)
    PASS : DKIM signature for d=kernel.org, s=default
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

However, since we include the subject of the commit (as git sees it)
into the "i" hash, any changes to the subject header that aren't extra
prefixes like ``[topic]`` will result in verification failure::

    $ ./main.py -m emails/korg-signed-dkim-changed-subject.eml verify
    Using emails/korg-signed-dkim-changed-subject.eml as message source
    Verifying: Plain DKIM
    DNS-lookup: default._domainkey.kernel.org.
    PASS : identity and domain match From header
    PASS : time drift between Date and t (2 days, 23:24:18)
    PASS : DKIM signature for d=kernel.org, s=default
    ----- ---------------
    FAIL : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    FAIL : Some or all hashes failed verification

Using the X-Patch-Sig header
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
There may be several reasons why you may not want to use DKIM for the
purpose of attesting the X-Patch-Hashes header:

  - you may not have sufficient control over the infrastructure
    performing DKIM signing, for example if your company uses a
    commercial upstream relayhost that performs DKIM signing for your
    domain
  - you may not want to exclude the "subject" header from your DKIM
    configuration, as it reduces the overall scope of your email
    attestation
  - you may not want to rely on DNS for the purposes of public key
    lookups, since DNS records are easily spoofed (and DNSSec adoption
    is still very low)

For these reasons, we also introduce a separate "X-Patch-Sig" header
that acts as a compatible subset of the DKIM RFC:

  - we only use the "x-patch-hashes" header, omitting the need for the
    h= record, and always normalize it as "relaxed"
  - we omit the bh= field entirely
  - we omit the v= field, since we will rely on the v= value in the
    X-Patch-Hashes header for versioning info
  - we add the m= field to indicate the signature mode (dk, wk, pgp,
    wkd, discussed below)
  - for the purposes of the POC, we hardcode the algorithm to
    ed25519-sha256, though other algorithms like rsa-sha256 or
    rsa-sha512 can be easily implemented

The signature is generated in the exact same way as the DKIM signature,
by concatenating the x-patch-hashes header and the x-patch-sig header
(after normalizing them using the "relaxed" mode), obviously excluding
the content that follows b=.

Here's the result of running the POC code, using the bundled dk.key::

    $ ./main.py sign-dk
    Signing: X-Patch-Sig header using dk mode
    Using emails/unsigned.eml as message source
    --- MESSAGE STARTS ---
    [...]
    X-Patch-Hashes: v=1; h=sha256; i=pkD5Pg8+cndZAzQQzo3RBSOOUzZM3GYWxiFIKFGIKe0=;
     m=yW4TvC/DGWCUJTa11Aw1b/2ZAXobsLD45aLA/440yQI=;
     p=iJdYN6+isP/3HmQaf1IiG7OfA1vzRxXlPGZtvecS484=
    X-Patch-Sig: m=dk; d=example.org; i=@example.org; s=patches; t=1600268242;
     a=ed25519-sha256;
     b=Ot3276T9ebQJ5Rzof7TNjz70IVpq9y/4ggevAO9iHVDg3P2tgBesuu2w/6mRIZ6m7mYuy22fNUW
     3hmxYCG9VCegq3sEw9y0B7Poj6fvA6ZBcza41HhCNxb5J44UFgnDM
    [...]

DK Mode
~~~~~~~
The DK mode is fully compatible with the DKIM standard and will perform
the exact same DNS query to look up the public key for the selector
specified::

    $ ./main.py -m emails/korg-signed-dk.eml verify
    Using emails/korg-signed-dk.eml as message source
    Verifying: X-Patch-Sig (mode=dk)
    DNS-lookup: patches._domainkey.kernel.org.
    PASS : identity and domain match From header
    PASS : time drift between Date and t (4 days, 5:56:18)
    PASS : mode=dk signature verified for: d=kernel.org, i=@kernel.org, s=patches
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

WK Mode
~~~~~~~
Instead of looking up the public key using DNS, we perform a HTTPS
lookup instead. This has the advantages of being more secure, but
requires caching, TTL expiration, and proxy configuration by the client,
plus is more fragile due to the less distributed nature of the web as
opposed to the distributed and fault-tolerant implementation of DNS.

The query is performed to the domain name specified in the signature,
using the following rule::

    https://[domain]/.well-known/_domainkey/[selector].txt

The contents of the txt file are the same as the contents of the TXT
record. We have it configured for kernel.org and you can perform a
verification lookup using the provided example::

    $ ./main.py -m emails/korg-signed-wk.eml verify
    Using emails/korg-signed-wk.eml as message source
    Verifying: X-Patch-Sig (mode=wk)
    Retrieving: https://kernel.org/.well-known/_domainkey/patches.txt
    PASS : identity and domain match From header
    PASS : time drift between Date and t (4 days, 6:18:45)
    PASS : mode=wk signature verified for: d=kernel.org, i=@kernel.org, s=patches
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

Developer-level attestation
---------------------------
The domain-level attestation has significant advantages, but also
important drawbacks:

 - advantage: it allows auto-enrolling entire companies, without the
   need for individual developers to make any changes to their usual
   routines
 - advantage: it piggybacks on the existing DKIM standard, which has
   a proven success record
 - disadvantage: it requires changes to the IT infrastructure, including
   adding a new milter daemon to the authenticated SMTP relay, which has
   security and stability implications
 - disadvantage: it requires explicit trust that the infrastructure
   performing the hashing and signing has not been compromised by
   malicious attackers
 - disadvantage: it allows someone with access to a compromised account
   to send out patches purporting to be coming from an official employee
   of the company
 - disadvantage: it is not useful to unaffiliated developers sending
   patches from generic email addresses (gmail, yahoo, hotmail, etc).

These disadvantages can be mitigated by allowing individual developers
to provide their own signatures, using the "pgp" and "wkd" modes of the
X-Patch-Sig header.

PGP mode
~~~~~~~~
Many open-source projects already provide a mechanism for developers to
exchange and use PGP keys for the purposes of code attestation (e.g. via
signed git tags and git commits). We can easily use GnuPG to provide the
signature content of the X-Patch-Sig header.

Here is an example from the bundled emails/mricon-signed-pgp.eml::

    X-Patch-Hashes: v=1; h=sha256;
     i=pkD5Pg8+cndZAzQQzo3RBSOOUzZM3GYWxiFIKFGIKe0=;
     m=yW4TvC/DGWCUJTa11Aw1b/2ZAXobsLD45aLA/440yQI=;
     p=iJdYN6+isP/3HmQaf1IiG7OfA1vzRxXlPGZtvecS484=
    X-Patch-Sig: m=pgp; i=mricon@kernel.org; s=0xE63EDCA9329DD07E;
     b=iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX1+/nQAKCRC2xBzjVmSZbFiQAQD42c
     l5It3AVJbtkwbY5XZxb9I9YuvvX3L3buU+EwjumwD9HBH8t6xcavIKQF6dwKjsmhwJnDj1tCfaxg
     3WRdUllgM=

Since a lot of the attesting information is already embedded into the
PGP signature itself, the header structure is different from the "dk" or
"wk" mode:

  - we don't need to know the domain, since we won't be doing any
    lookups on our own (GnuPG can handle this, if configured)
  - the selector field identifies the public key ID of the certification
    subkey, for ease of lookups
  - the identity field is informational only, but can be used by GnuPG
    to perform WKD lookups, if it matches the From header (not
    implemented in the POC)
  - the timestamp field is missing, since this data is embedded into the
    PGP signature itself

On the verification side, if the key specified by the selector is
already present in the verifier's default keyring, we will verify that
the signature is GOOD, VALID, and that it is either TRUST_FULLY or
TRUST_ULTIMATE.

If the key is not present in the verifier's default keyring, the POC
will check if there is a matching entry in .keys/openpgp/keys/[keyid].asc,
and if so, will use .keys/openpgp/pubring.kbx for performing the
verification. In this case, TRUST_* fields are not used, as they will
always be "unknown".

In-git key distribution is discussed further below.

WKD mode (EXPERIMENTAL)
~~~~~~~~~~~~~~~~~~~~~~~
I wanted to provide a way for developers to use a WK-like mode for
public key lookups as an alternative to PGP. The signature is generated
just like for the domain-level WK mode, using the ed25519 key provided
by each individual developer.

Here's the POC running with the bundled "ingit.key"::

    $ ./main.py sign-wkd
    Signing: X-Patch-Sig header using wkd mode
    Using emails/unsigned.eml as message source
    --- MESSAGE STARTS ---
    [...]
    X-Patch-Hashes: v=1; h=sha256; i=pkD5Pg8+cndZAzQQzo3RBSOOUzZM3GYWxiFIKFGIKe0=;
     m=yW4TvC/DGWCUJTa11Aw1b/2ZAXobsLD45aLA/440yQI=;
     p=iJdYN6+isP/3HmQaf1IiG7OfA1vzRxXlPGZtvecS484=
    X-Patch-Sig: m=wkd; d=example.org; i=dev@kernel.org; s=patches; t=1600270651;
     a=ed25519-sha256;
     b=/s2WOrzK2tmqCYj3x22uck6Yi6V1ODX+PZiE2TLstSoVDGvTAaYoPZwmO7IKbUC148KEeGVXB0W
     g+wGNtQn3AmUsvnoX0Jppqc5ei6GDzr0yMQKzEbUt0DkPrd/Y000b
    [...]

It is very similar to content created in the "dk" or "wk" mode, except
the identity field includes the entire email address of the developer.

When we verify the attestation, we will do the following:

  - check if that key is available in .keys/devkey/[domain]/[local]/[selector].txt
  - if it is not present, we perform a https query to
    https://[domain]/.well-known/devkey/[zbase32-encoded-hash-of-local]/[selector].txt

The hashing and zbase32-encoding is taken to be compatible with
openpgp's WKD implementation and is done to prevent someone from easily
finding out everyone's email addresses from unprotected directory
listings.

You can run the verification using the POC example. Here's the run
without using the in-git matching key::

    $ ./main.py -m emails/mricon-signed-wkd.eml verify
    Using emails/mricon-signed-wkd.eml as message source
    Verifying: X-Patch-Sig (mode=wkd)
    Retrieving: https://kernel.org/.well-known/devkey/sapsizz4qsj4zmmscbz9f7y8cunt496y/patches.txt
    PASS : identity and domain match From header
    PASS : time drift between Date and t (4 days, 6:58:47)
    PASS : mode=wkd signature verified for: d=kernel.org, i=mricon@kernel.org, s=patches
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

Here is the same, but using the public key provided in the git
repository itself::

    $ ./main.py -m emails/dev-signed-wkd-ingit.eml verify
    Using emails/dev-signed-wkd-ingit.eml as message source
    Verifying: X-Patch-Sig (mode=wkd)
    Loading: WKD key from /var/home/user/work/git/patch-attestation-poc/.keys/devkey/kernel.org/dev/patches.txt
    PASS : identity and domain match From header
    PASS : time drift between Date and t (4 days, 7:28:47)
    PASS : mode=wkd signature verified for: d=kernel.org, i=dev@kernel.org, s=patches
    ----- ---------------
    PASS : metadata
    PASS : commit message
    PASS : diff content
    ----- ---------------
    PASS : All hashes verified

The structure and nature of the WKD mechanism is entirely up for
discussion (along with everything else in this proposal).

Automating developer attestation
--------------------------------
The easiest way to automate developer attestation is by providing a
sendmail-compatible "attest-and-send" utility that can be a drop-in
command settable via git's sendemail.smtpServer config setting. It would
be automatically invoked whenever git-send-email runs and would inject
the X-Patch-Hashes and X-Patch-Sig headers before sending the emails to
the SMTP server specified via the rest of the sendemail configuration
options.

In addition to creating these headers, this tool can also automatically
add all emails going through it to the developer's personal public-inbox
archive that can act as a separate source of patch data in addition to
mail delivered via SMTP and mailing lists.

Public keys bundled with git repos
----------------------------------
Delegated trust is hard and securely bootstrapping your trusted
identities is even harder. There are existing proposals to include
developer keys as part of the git repository itself in order to make it
possible for someone to quickly bootstrap their keyring with trusted
identities. Obviously, this introduces a chicken-and-egg problem of
getting your source of trust from the thing you're trying to attest in
the first place. However, no mechanism short of in-person meetings is
able to provide perfect levels of assurance, so in-git key distribution
remains as good a source of bootstrap trust as any.

The implementation in this POC is naive and shouldn't be used for
serious purposes. An emerging proposal like did:git
(https://github.com/dhuseby/did-git-spec/blob/master/did-git-spec.md) is
a more thoroughly considered approach and should probably be preferred.

Where should verification be performed
--------------------------------------
Signature verification should be performed by the maintainer evaluating
the patches they received for inclusion into the git repository. The POC
already pulls in "b4" as a dependency for the patch hashing routines,
and I intend to add the header-based verification mechanisms in the
future release of b4, once this proposal is thoroughly discussed.

Similarly, browser and other email client plugins can be written to
indicate to the developer whether the patches they are viewing pass
signature verification. If this proposal is adopted, we can come up with
implementations for Gmail, Mutt and Emacs, which should cover a
significant number of end-user tools.

