Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190213AD1C
	for <workflows@vger.kernel.org>; Tue, 14 Jul 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026013; cv=pass; b=TaRwyA90SHI2CP12P0N4N2UcRm0qsuIl0WJ4Z28FUoyFr4v3G8x8SvtOvGJDHU5gYICu4WuEkMzhGq9d9RmlyWdsODfkVvKb6oJEyormXJ/GOvJmgs8Vw+Wjzk8kstf8JbRjcfQ3995rPZLjorRBAcrlLJJ/l4YUo7KejBVHwdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026013; c=relaxed/simple;
	bh=mdhuYALIRH2WZ6nP3C1YoFgq/rUqlzRofryifcryUEA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=caz1EfLxLBueEajoy9zQ6torfxfM4U89307Q38fzpJZNgMu6LTil63+puRskW5l95D5lza/B0Hi1rNYNVrX6WbYaXh9pCI88cu33HQXTnXaexWDrPSKQ1GdsvX59bvt9YmgBBZtftWvWZ69Dd/lb9ePOv7Rm0J8yQo4j7f60viM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd/P4BHQ; arc=pass smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd/P4BHQ"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c159467cca6so42234166b.0
        for <workflows@vger.kernel.org>; Tue, 14 Jul 2026 03:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784026010; cv=none;
        d=google.com; s=arc-20260327;
        b=jkjNP2LQJBv8nV0K3++iXNK14v+4V2LHt+/iumTHUoDLjVb52kSHQ45zh+5e6x5uOj
         7MX8tHFMTDfPMy0jzoWq3OytC1TrQdDAI4+pyt2NgfWjvjfT9SS282sR4MUHDiTzdG03
         +Oxz4lJoOGzHpR3XK1YF3oEsJHL7BmF9Tv6UAZeS2bf0NwZDE7Q6tSk4yVtP0asP17fK
         33MjgzD0CRKIcmjaXjNxe/A9JpbVbhjAJ1OuhZgQzDGD4rvI8+lWChLYLP7kC2ytin34
         vdLg32yqMCvnkL+2IQTIwbY2peQAaz5yzajYo/az1UhxGILJcKSQ98MjQgIiYXbFH55H
         ENcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JMiiLaWZHxi8D3wylL9KT3c3GiQ8G9+5YvO4TUJ2I6I=;
        fh=IIqKjfH2//QKXuNstS364+ZKq0my8uNJ8ciD5u7+F3M=;
        b=QckmyKjWfM7ODHUfqfDU77Qak0/J3nH5FcoryjwHLGJLvzyezymJiHCsDT5hdct+Cx
         Jo97ga4a2EJNSwmI1sAjKJ3onguls1xRRqruTmm7OPU4bTSpqByGhhhJpooW6xQmKIVY
         vtCI67V7+a2xWBPr7R0/F5GqaJVl/Jhbig1XC1MbznsWuoXV3fB14Ocl0rLSKbz2QQum
         smdMlwbTikNt9Z7x2idUHqw2poYwseaVNcT+vFsDnqRDVts3fTPWQW0tHpvhZ4rMTyOk
         heZAP+accgtb8eQvc8d8JVcGHfFZfcnIfAyKXh6xty0aB6JXHAmtvEJt6MCaAwhHNDxU
         6/EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784026010; x=1784630810; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JMiiLaWZHxi8D3wylL9KT3c3GiQ8G9+5YvO4TUJ2I6I=;
        b=dd/P4BHQt9u+ks9zPpuradac5t26s9gEADFvZjBrx/XuyXVM/zO00kNHWRXXNVTwm6
         vre/BTAA1qTbRcZcFUB0L+gy1jKirUQaJwasX5FrHOu9YL3OaKnQVK8uZBoeXl8rlRz+
         xsrQAyCaubspEp+HDG/+yziLeVhFB/vMAPANgG1JOGBTyv34OZHwO5pglA7+Hjc126nB
         g1gnwaCrYQO6scnkB2/Sbh6oOa/KR/EGIG/XFPP5Fws++Au1yxJhTkeet+1huPHZcMZR
         ZaWGIf2eo0QC8bMji4EKZh+9Hv7qptymoDROFVgdHsTICVR9k+/J8AOVINE+/h8Myn1t
         Wz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026010; x=1784630810;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMiiLaWZHxi8D3wylL9KT3c3GiQ8G9+5YvO4TUJ2I6I=;
        b=cqCc/99r99ha8OAeFuoGDj6nQGs4SC/pGi5vh5jvraED2Jvtg0dVKyHY6cnK6hNQqA
         v1WHJh17o+5+8G6dtkq47jeSqXBssBBXI/LIJFeVKmmY8fd/M8L5xT6VgB5Gkmmj+TV6
         gIQbAUXHawOdOCnVl2e3WIQiLUjqKtamq2I87IQ+iEBL/KpzpeGsdtKESSKccI0AZHuQ
         bp2ieS3PH/df2dEO8x4VWUiWECSOonhIpTnhKAeEdjwwiBjSpD6Ab3HHFOwWAPVEWJ7i
         vc9l/kupKXopQPoP24/ONOkf/dA+L/RqfKNPDxhrlRkiFiaRFcvDDaQYJBrEFHUX15cH
         Ga+g==
X-Forwarded-Encrypted: i=1; AHgh+Roeyq7yTEXppnjXBtIxEFkg3PmEk0OYrZa8W9m5BgVceZhq5U1fr7s79ORVGE3gMHl7oFonmGfa0k0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxl2RQp1Igtn7x0wbm/3l3suIoTKfUvbyYxRW8ZRYmMrs8iys3
	PWSEhHzYPd8L62TSRhyI79OXTUfNxQ6Efnhr/dhGwD91t8sdSAfT8uMefpOgzwbXaQH+sI6f/s3
	DYuDtvQgsyEtLyMZ9afDN59JIFHT6MVY=
X-Gm-Gg: AfdE7cmSb9oBdV7YRS4dHJYrNCqCyb8H/D1sCwHXs6LUMZWb34efGHnKoVnEy18IGB5
	P/Eh9/OJOGvApVZUCptOaU+iRPUk+xdbzLy7PCxWBk0gBpIBF2ueUz8VfcMo4kjVBO/O3Tz4SxD
	WcwqhkuxDBBNxdYN5RIzlNgEHcdcOKTpKpu1fYsf/Zi5/3Vbn/CRqU4fd1S5qpM5OMFUKbbO+Ov
	KqiFlEysqoldHRfFdeYDQjxd0K9CgdosJ9pqtC7T63Xv3OuQXxrXedJhMD1B+nqp/Vq00xwZlSr
	ACorHMBAoBh1w48wM6XoteSqRCf8
X-Received: by 2002:a17:907:9d19:b0:c16:6f41:8bf1 with SMTP id
 a640c23a62f3a-c166f419610mr27149466b.3.1784026009930; Tue, 14 Jul 2026
 03:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Spuntik <spuntik1205@gmail.com>
Date: Tue, 14 Jul 2026 12:46:41 +0200
X-Gm-Features: AUfX_mx5vPcUH0EOzBNgZP-CQqRYyoiVx-IqmkUsFGa1ytLB1cXPCZgfj6egJgw
Message-ID: <CAA7kybvhDafxcsOv-JTeB5NfqBgiTivp671yMsnHeS8T8MOO6Q@mail.gmail.com>
Subject: [PATCH] Add SECURITY.md to redirect GitHub users to official security channels
To: linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 9b140a7e28c8480ab51bc5441c4d40fa5e5a4e90 Mon Sep 17 00:00:00 2001
From: spuntik1205 <spuntik1205@gmail.com>
Date: Tue, 14 Jul 2026 12:22:32 +0200
Subject: [PATCH] Add SECURITY.md to redirect GitHub users to official
security channels

GitHub natively supports a `SECURITY.md` file in the root of the
repository. When this file is present, GitHub automatically
creates a "Security" tab for the repo and displays a prominent link to
this policy whenever a user attempts to open a new issue.

Since the Linux kernel mirror on GitHub receives a lot of traffic from
users who may not be familiar with the kernel's
mailing-list workflow, they might incorrectly attempt to report
security vulnerabilities through public GitHub channels.

This PR adds a standard `SECURITY.md` file that:
1. Explicitly asks users not to report vulnerabilities on GitHub.
2. Directs them to the official `security@kernel.org` mailing list.
3. Links directly to the official `security-bugs.rst` documentation on
kernel.org for proper reporting procedures.

While I understand the kernel does not use GitHub for development,
adding this file will help intercept confused GitHub users
and redirect them to the proper kernel security workflows.
---
 SECURITY.md | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 000000000000..80b0b46279f6
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,19 @@
+# Security Policy
+
+## Supported Versions
+
+The Linux kernel maintains several active branches. The mainline
kernel, stable kernels, and longterm maintenance (LTS) kernels are
currently supported with security updates.
+
+Please refer to the [active kernel
releases](https://www.kernel.org/category/releases.html) on kernel.org
to see which versions are currently receiving security updates.
+
+## Reporting a Vulnerability
+
+**Please do not report security vulnerabilities through public GitHub issues.**
+
+If you believe you have found a security vulnerability in the Linux
kernel, please report it to the Linux kernel security team.
+
+1. **Email the Security Team:** Send an email to `security@kernel.org`.
+2. **Read the Documentation:** For detailed instructions on what to
include in your report, acceptable disclosure timelines, and how the
kernel team handles security bugs, please read the official [Security
Bugs Documentation](https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html).
+3. **Hardware Vulnerabilities:** If you are reporting a hardware
vulnerability that affects the kernel, please refer to the specific
guidelines for [Hardware
vulnerabilities](https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html)
and contact the hardware security team at
`hardware-security@kernel.org` if appropriate.
+
+The security team will review your report and work with you and the
relevant subsystem maintainers to develop and release a fix. You can
typically expect an initial response within a few days.
-- 
2.55.0
