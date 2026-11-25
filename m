Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612350;
	b=1vuMEXOwShkCWDNda4zeZ3OeikhqepzvQYbEI2sO6hSiM3vr0HxXYbzRPIuBGFkMLSqg
	 lkjOsjP5kzG7A3vLq0RMHjAHx0V/6XwXYksE5VWH6hDgwdRzIZIXqx9d7zAo328CL4t2n
	 jD7XmDlLCoqNdlgFqplpSBM+LvYObEGcusar8Dlm4ysTlNXiYOoj+LsljGB/GBd0qeziV
	 1uoum38pLgaXzDyEsM4ntvWH1nBOIyESuWGObhYd7F1s2Ya6abli1Jl5vFQHVwHZUqAPu
	 bsAaLTNSVQOXiepVRaph1vX7gg7qVU45J1Ni0ctaHN5oDaSbk4Rz38z0u1mHEJigAaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:In-Reply-To:References:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
	b=xf0YN2JEn87bBWlsoe/fPy9RdVv8jzCUu7MaHeufWYJzAk3wmQDxRDTA/Xewd40RD3cG
	 6/UMc/lbpfuelQBwpqUDuvyWPmWXVwKd9zn+ieWVoAzGXtFMpnjTCC+1vMT3lR1Y5M6rk
	 3yFtAMp8cpZGhwBfUjbIeNXEJisk1V5hQw36FyVKUiu2OE4usXAR7+9s+kr4bv+5f3G29
	 tvqYortwR3vKE2wVy8PxBh5sCRjzbrFVJl7EGqk2lqagbw7pVPSx2Q9oy9NEF+BuSbmXN
	 ifqUPYGZDZ3oS118Eas3otsOf/rPsEh/pE7ZRthDffzKpQhq6KGZyyXiO3SfmnC5L6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC95606A32A
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 13:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC95606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364042eecfso72070751cf.2
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612349; x=1796217149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=nNbG6lhMNlg9s3RxRiJNbZFCcJfSZu9DNa7mYpBntzBscZz1jH+GJVdRxODmIBn/XH
         9T3QeSZ0dBdrShV+5UTQlvRJDGWmaSFgwPG8xaK78m9+1IsZbQZh8uwdbPQRLpLbeQ4O
         xVf9SGqpPHCiDraZ/vP2iJjFbnzcI39gmq/x2WCzCnLx8mO2lMKqvHamXx7lbVYnXZLk
         hcuvxmVxfNp9NbLMuVJ3iDg3B8wRXBSTMgQwkQF6CqLuXOfDj+xbdovSj5yUEFllih75
         XhL6PeZGqPIxDJiSVo3a5v8EE/vrplOfFcWFgb30mkGU9pUBVGKlZqSfFrPBsPBaAqh7
         Z59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612349; x=1796217149;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=ycBH9Tfih0rHvB6xIo8Krl7VrqAmp5KYb2U0jJU7KfM0We7W/jnP2a9BrklJHZWyDB
         fVL2C+E/nYU3bmKhlIj15N2seKk2wY6ndHpdm2z9/iMrPGZSZfGsFPNpHhDrA2n4GkAx
         UjQvxUoA8JoobKtJI2yUb+N3BDPYPlg6di+LxOkxiwzGEh+FMopc8EPVW1fhCA6sF29O
         tNTMQrZCskMxRdokqrjp6z5pJ412Q4x0Zs572WD5ORRpJMYxfE5UCJcFRNQrfcinu6Bk
         LkaAFkDC+7jDAsVwzP2q4UV61IWAIZie2zmK1JJWqmIoB6r2InU6q1ogSMdB28l10A4n
         pUOg==
X-Forwarded-Encrypted: i=1; AL+hErGcNEjSlO/9hkUSf6+CFhIFrE2z5yRYi2T0PdgG0WtJRwdAcjqMprdnV+5xJyelxEq6pJjruXe6J8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9gQWyiIhUy1aWmZkat1+ZErzHzkZi6EtSs+XjrJIkv5B7rAAb
	ZnRSFNk9G+R156Q6NigX3+1WWT5Ply6T7uwUZ0z8kHZiPV/VjvCOiLI=
X-Gm-Gg: AZFdTZdC5dQoh39XtPNsg0P3CZYOQzFjjK262kyCKCYlbmsC9mL/3PldQLjMyK9zktb
	GW62wiFIBxi6aq93Ah15vX7mNX4DjNJm/QoHzGQhic8ZndZRtuulLb0TpdhAwdPeJWOdB4V3u8A
	qbM8w107VXscW+HwF9JjtZdHYVdiuEhajYxa9bg1ZMSTh/DkSN+ZXA1eV5gVUZh8+gNFf3MnXQ5
	JetCxeNDAFv6e48cBA6nFzGnun6+n6yvXRL4miARsCgbOddgNnX1tB+ESgecGolreEeGg3CkJ3N
	qgeIF/RAOru3TyCi6T8qBGEXQGDIwZLDQap8VYh290k/QwkbJ96w/29shluEHJBVrCkhNhezaYR
	WrO9YbGiQR0FxIvVD40tcSTB8qB6gucADjKbvryT7G8ENkg6duvSZOnPAwxK8/3zsOyPOygNic7
	RtUJFkls87y0HyMydeXIrHVmtCyKAVtXukYUxGeiKhXtGJT4+9/OICY6LceKNXgJ2jwIQI2WKcg
	c1ogNRDthZhZTD2BxkiR5PqR0whQgfKp+nzImurcayZyjN9R07uckF4Q+5HvONmc5NpBfV3+Kzm
	RNJtUETRoztb6Jxn5bLk69INhaV2+hXio3NULjzrE8b7MrE8cRJbLdIljMmfp7leU6M3K2rEYF5
	dyaff4zHQCxNnyMKrL8i2k37+5T/Z0hBPD8IX5f/2HSazpTwbyv7YQ/IMUtIOZmNK613TqWo=
X-Received: by 2002:a05:622a:34f:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d768a24f3mr359297361cf.11.1795612348580;
        Wed, 25 Nov 2026 05:12:28 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:27 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Subject: [PATCH v3] Documentation: kunit: document --summary and --failed
 options
In-Reply-To: <179561234149.225312.4673144866194884043@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
 <179561234149.225312.4673144866194884043@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179561234149.225312.11200387441465771003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v3:
- Reworded both entries per David's suggestions: say what the summary
  contains, and that --failed hides passed and skipped tests.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110..9e0d83d 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,15 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary of the test results,
+  including the number of tests run and how many failed, rather than the
+  result of every individual test. Does nothing if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed,
+  along with the summary line, once all tests have run. Passed and skipped
+  tests are not printed, which makes failures easier to spot in a large
+  run. Does nothing if ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


